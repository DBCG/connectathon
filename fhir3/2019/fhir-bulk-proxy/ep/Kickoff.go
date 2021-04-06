package ep

import (
	"bufio"
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"strings"

	"github.com/fhir-bulk-proxy/s3ops"
)

var jobCount = 0
var jobsStatus = make(map[int]*StatusResponse)

func Import(w http.ResponseWriter, r *http.Request) {

	var err error
	jobId := 0
	response := make(map[string]interface{})
	defer func() {
		w.Header().Set("Content-Type", "application/json")
		if err == nil {
			w.Header().Set("Content-Location", fmt.Sprint(os.Getenv("EXTERNALURL"), "/", "status", "/", jobId))
			w.WriteHeader(202)
		} else {
			w.WriteHeader(500)
		}
		json.NewEncoder(w).Encode(response)
	}()

	if r.Header.Get("Content-Type") != "application/json" {
		response["error"] = "Unsupported header: Content-Type, required application/fhir+json"
		return
	}
	if r.Header.Get("Accept") != "application/fhir+json" {
		response["error"] = "Unsupported header: Accept, required application/fhir+json"
		return
	}
	if r.Header.Get("Prefer") != "respond-async" {
		response["error"] = "Unsupported header: Prefer, required respond-async"
		return
	}
	jobCount++
	jobId = jobCount
	jobStatus := &StatusResponse{
		OverallProgress: &ResourceStats{},
	}
	jobsStatus[jobCount] = jobStatus
	reqObj := KickoffRequest{}
	err = json.NewDecoder(r.Body).Decode(&reqObj)
	if err != nil {
		log.Println(err)
		return
	}

	completionMonitor := make(chan bool)
	for k, v := range reqObj.Input {
		go processResource(reqObj.TargetURL, v, jobStatus, jobId, k, completionMonitor)
	}
	go completionHandler(&reqObj, completionMonitor, jobStatus)
}

func completionHandler(reqObj *KickoffRequest, completionMonitor chan bool, jobStatus *StatusResponse) {
	for i := len(reqObj.Input); i > 0; i-- {
		<-completionMonitor
	}

	jobStatus.OverallProgress.Complete = true
}

func processResource(targetURL string, in KOInput, jobStatus *StatusResponse, jobId int, resourceId int, completionMonitor chan bool) {
	res, err := http.Get(in.URL)
	errorChan := make(chan []byte)
	if err != nil {
		log.Println(err)
		byteArr, _ := json.Marshal(err)
		errorChan <- byteArr
	}
	successChan := make(chan []byte)
	failureChan := make(chan []byte)
	go responseHandler(successChan, jobId, "success", fmt.Sprint(jobId))
	go responseHandler(failureChan, jobId, "failure", fmt.Sprint(jobId))
	go responseHandler(errorChan, jobId, "error", fmt.Sprint(jobId))
	r := bufio.NewReader(res.Body)
	jobStatus.OverallProgress.TotalBytes += uint64(res.ContentLength)
	jobStatus.ResourceProgress = make(map[string]*ResourceStats)
	jobStatus.ResourceProgress[in.URL] = &ResourceStats{
		TotalBytes:      uint64(res.ContentLength),
		SuccessLocation: fmt.Sprint(os.Getenv("BUCKET"), "/", jobId, "/", "success", "/", fmt.Sprint(jobId), ".ndjson"),
		FailureLocation: fmt.Sprint(os.Getenv("BUCKET"), "/", jobId, "/", "failure", "/", fmt.Sprint(jobId), ".ndjson"),
		ErrorLocation:   fmt.Sprint(os.Getenv("BUCKET"), "/", jobId, "/", "error", "/", fmt.Sprint(jobId), ".ndjson"),
	}
	for {
		byteArr, err := r.ReadBytes('\n')
		if err == nil || err == io.EOF {
			if len(byteArr) > 1 {
				go hitFHIRServer(targetURL, successChan, failureChan, &in, byteArr, jobStatus)
			}
			if err == io.EOF {
				jobStatus.ResourceProgress[in.URL].Complete = true
				completionMonitor <- true
				break
			}
		} else {
			log.Println(err)
			byteArr, _ := json.Marshal(err)
			errorChan <- byteArr
		}
	}
}

func getDefaultSubmissionUrl(in KOInput) string {
	switch in.Type {
	case "Bundle":
		return os.Getenv("SUBMISSIONURL")
	default:
		return fmt.Sprint(os.Getenv("SUBMISSIONURL"), "/", in.Type)
	}
}

func getSubmissionUrl(targetURL string, in KOInput) string {
	switch in.Type {
	case "Bundle":
		return targetURL
	default:
		return fmt.Sprint(targetURL, "/", in.Type)
	}
}

func hitFHIRServer(targetURL string, successChan chan []byte, failureChan chan []byte, in *KOInput, payload []byte, stats *StatusResponse) {
	submissionURL := getDefaultSubmissionUrl(*in)
	if targetURL != "" {
		submissionURL = getSubmissionUrl(targetURL, *in)
	}

	//log.Print("POST request will be sent to %s\n",submissionURL)

	resp, err := http.Post(submissionURL, "application/json", bytes.NewReader(payload))
	defer resp.Body.Close()

	if err != nil || resp.StatusCode > 299 || resp.StatusCode < 200 {
		if err != nil {
			log.Println(err)
		}
		failureChan <- payload
		stats.ResourceProgress[in.URL].FailedPosts++
		stats.OverallProgress.FailedPosts++
	} else {
		successChan <- payload
		stats.ResourceProgress[in.URL].SuccessfulPosts++
		stats.OverallProgress.SuccessfulPosts++
	}
	stats.ResourceProgress[in.URL].BytesProcessed += uint64(len(payload))
	stats.OverallProgress.BytesProcessed += uint64(len(payload))

	if stats.ResourceProgress[in.URL].BytesProcessed == stats.ResourceProgress[in.URL].TotalBytes {
		//Get keyName for each object in S3 and create pre-signed url which are valid for 48 hours
		bucket := fmt.Sprint(os.Getenv("BUCKET"), "/")
		successKey := strings.Replace(stats.ResourceProgress[in.URL].SuccessLocation, bucket, "", 1)
		successURL, err := s3ops.GetPreSignedUrlFromS3(successKey)
		if err == nil {
			stats.ResourceProgress[in.URL].SuccessLocation = successURL
		}

		failKey := strings.Replace(stats.ResourceProgress[in.URL].FailureLocation, bucket, "", 1)
		failURL, err2 := s3ops.GetPreSignedUrlFromS3(failKey)
		if err2 == nil {
			stats.ResourceProgress[in.URL].FailureLocation = failURL
		}

		errorKey := strings.Replace(stats.ResourceProgress[in.URL].ErrorLocation, bucket, "", 1)
		errorURL, err3 := s3ops.GetPreSignedUrlFromS3(errorKey)
		if err3 == nil {
			stats.ResourceProgress[in.URL].ErrorLocation = errorURL
		}

		close(successChan)
		close(failureChan)
	}

	if resp.StatusCode != 201 && resp.StatusCode != 200 {
		log.Println(submissionURL)
		text, _ := ioutil.ReadAll(resp.Body)
		log.Println(string(text))
		log.Println(string(payload))
	}
}

func responseHandler(byteChan chan []byte, jobId int, folder string, fileName string) {
	byteContainer := s3ops.NewByteContainer(byteChan)
	err := s3ops.CreateS3Connection(byteContainer, os.Getenv("BUCKET"), jobId, folder, fileName)
	if err != nil {
		log.Println(err)
	}
	if len(os.Getenv("BUCKET")) > 0 {
		s3ops.WaitForFile(os.Getenv("BUCKET"), fmt.Sprintf("%d/%s/%s.json", jobId, folder, fileName))
	}
}

type KickoffRequest struct {
	InputFormat   string `json:"inputFormat"`
	InputSource   string `json:"inputSource"`
	StorageDetail struct {
		Type string `json:"type"`
	} `json:"storageDetail"`
	Input     []KOInput `json:"input"`
	TargetURL string    `json:"targetUrl"`
}

type KOInput struct {
	Type string `json:"type"`
	URL  string `json:"url"`
}
