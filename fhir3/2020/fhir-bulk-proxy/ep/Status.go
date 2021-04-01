package ep

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
)

func Status(w http.ResponseWriter, r *http.Request) {

	var id, err = strconv.Atoi(mux.Vars(r)["id"])
	defer func() {
		if err != nil {
			if jobsStatus[id].OverallProgress.Complete {

				w.WriteHeader(200)
			} else {
				w.WriteHeader(202)
			}
		} else {
			w.WriteHeader(500)
		}
	}()

	if err != nil {
		log.Println(err)
		return
	}
	if _, ok := jobsStatus[id]; !ok {
		log.Printf("No job found: %d\n", id)
		return
	}

	w.Header().Set("X-Progress", fmt.Sprintf("%d/%d", jobsStatus[id].OverallProgress.BytesProcessed, jobsStatus[id].OverallProgress.TotalBytes))
	w.Header().Set("Retry-After", "1")
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(jobsStatus[id])
}

type StatusResponse struct {
	OverallProgress  *ResourceStats
	ResourceProgress map[string]*ResourceStats
}

type ResourceStats struct {
	TotalBytes      uint64
	BytesProcessed  uint64
	SuccessfulPosts uint64
	FailedPosts     uint64
	Complete        bool
	SuccessLocation string
	FailureLocation string
	ErrorLocation   string
}
