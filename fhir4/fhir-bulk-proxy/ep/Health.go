package ep

import (
	"encoding/json"
	"net/http"
)

func Health(w http.ResponseWriter, r *http.Request) {

	responseJSONStr := `{"status": "Healthy"}`

	var response map[string]interface{}
	json.Unmarshal([]byte(responseJSONStr), &response)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)

	json.NewEncoder(w).Encode(response)
}
