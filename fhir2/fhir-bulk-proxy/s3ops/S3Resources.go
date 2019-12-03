package s3ops

import (
	"fmt"
	"io"
	"log"
	"os"
	"time"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
)

type ByteContainer struct {
	Bytes         []byte
	EOFFlag       bool
	Offset        int
	objectChannel chan []byte
}

func NewByteContainer(objectChan chan []byte) *ByteContainer {
	temp := new(ByteContainer)
	temp.Bytes = make([]byte, 0)
	temp.objectChannel = objectChan
	return temp
}

func (container *ByteContainer) Close() error {
	close(container.objectChannel)
	return nil
}

func (container *ByteContainer) Write(p []byte) (int, error) {
	container.objectChannel <- p
	return len(p), nil
}

func (container *ByteContainer) Read(p []byte) (int, error) {
	if container.Offset >= len(container.Bytes) {
		newBytes := make([]byte, 0)
		keepLooping := true
		for keepLooping {
			select {
			case data, open := <-container.objectChannel:
				newBytes = append(newBytes, data...)
				if !open {
					container.EOFFlag = true
					keepLooping = false
				}
			default:
				keepLooping = false
			}
		}
		container.Offset = 0
		container.Bytes = newBytes
	}
	n := copy(p, container.Bytes[container.Offset:])
	container.Offset += n
	var outputError error
	if container.Offset >= len(container.Bytes) && container.EOFFlag {
		fmt.Println("EOF happened")
		outputError = io.EOF
	}
	return n, outputError
}

func CreateS3Connection(read io.Reader, bucket string, jobId int, folder string, fileName string) error {
	uploader := s3manager.NewUploader(GetSession())
	currentFilename := fmt.Sprintf("%d/%s/%s.ndjson", jobId, folder, fileName)
	var err error
	go func() {
		_, err = uploader.Upload(&s3manager.UploadInput{
			Bucket: aws.String(bucket),
			Key:    aws.String(currentFilename),
			Body:   read,
		})
		if err != nil {
			log.Println(err)
		}
		log.Println("S3 Write completed")
	}()
	return err
}

func WaitForFile(bucketName, fileName string) bool {
	conn := s3.New(GetSession())
	var i int
	for {
		err := conn.WaitUntilObjectExists(&s3.HeadObjectInput{
			Bucket: aws.String(bucketName),
			Key:    aws.String(fileName),
		})
		if err == nil || i >= 10 {
			if i >= 10 {
				return false
			}
			return true
		}
		i++
	}
}

func GetPreSignedUrlFromS3(keyName string) (string, error) {
	s3Svc := s3.New(GetSession())
	req, _ := s3Svc.GetObjectRequest(&s3.GetObjectInput{
		Bucket: aws.String(os.Getenv("BUCKET")),
		Key:    aws.String(keyName),
	})
	urlStr, err := req.Presign(48 * time.Hour)

	if err != nil {
		return "", err
	}

	return urlStr, nil
}
