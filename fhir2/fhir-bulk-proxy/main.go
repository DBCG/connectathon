package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/fhir-bulk-proxy/ep"
	"github.com/gorilla/mux"
)

func main() {
	log.SetFlags(log.LstdFlags | log.Lshortfile)

	r := mux.NewRouter()

	r.HandleFunc("/health", ep.Health).Methods("GET", "POST")
	r.HandleFunc("/$import", ep.Import).Methods("POST")
	r.HandleFunc("/status/{id}", ep.Status).Methods("GET")
	port := fmt.Sprintf(":%s", os.Getenv("PORT"))
	fmt.Printf("Application Started on PORT: http://localhost:%s\n", os.Getenv("PORT"))
	fmt.Println(http.ListenAndServe(port, r))
}
