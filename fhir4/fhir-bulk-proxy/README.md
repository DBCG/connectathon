# FHIR Bulk Data Submission Proxy

The proxy server reads input from given resource ndjson file and submits them to FHIR server one by one. Every submission is given a job-id and status can be requested using *status/{job-id}* endpoint. Outputs are saved on S3 bucket given as environment vraiable and signed URLs for the outputs are returned in status endpoint. SIgned URLs are valid for 48 hours. 


## Running Proxy Server Locally
If you want to run the app locally, source code needs to be copied to `$GOPATH/src/github.com` folder so that project folder is `$GOPATH/src/github.com/fhir-bulk-proxy`
Following environmental variables needs to be set:
- **PORT**			Port number for the application
- **BUCKET**		S3 bucket where the output files will be written. Note that instance where you run the proxy server should have AWS credentials with read/write access to this bucket
- **EXTERNALURL**		URL of the proxy server. This is used to construct status check url in response (i.e. if you are running the proxy server on a machine with IP address 34.227.73.197 and PORT 5000, set EXTERNALURL as http://34.227.73.197:5000)
- **REGION**		AWS region
- **SUBMISSIONURL**		URL for the default target FHIR server where the requests will be processed. This url is used if targetUrl is not supplied in the kick-off $import request

After setting these variables, application can be run using the commands in the source code main folder (you need to have go installed):
- `$ go get -d -v`
- `$ go run main.go`

To build application, you can use command `$ go build main.go` which will build a binary to run

## Running Proxy Server On Container
You need to update docker-compose.yml file for setting proxy server variables (same as environment variables above)
Run following commands (you need to have docker and docker-compose installed):
- `$ docker-compose build`
- `$ docker-compose up -d`


## http requests to proxy server

Sample http request to kick off $import (replace *localhost:5000* with your proxy server URL)
**targetURL** is the url for target FHIR server which will process the requests
**url** is the path for the input ndjson file

``` javascript
curl -X POST \
  'http://localhost:5000/$import' \
  -H 'Accept: application/fhir+json' \
  -H 'Content-Type: application/json' \
  -H 'Prefer: respond-async' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -d '{
        "inputFormat": "application/fhir+ndjson",
        "inputSource": "https://tolga-fhir-conn.s3.amazonaws.com",
        "targetUrl" : "http://54.208.172.145:8080/cqf-ruler/baseDstu3",
        "storageDetail": {
          "type": "https" 
        },
        "input": [
           {
             "type": "Patient",
             "url": "https://tolga-fhir-conn.s3.amazonaws.com/Patient.ndjson"
           }
        ]
      }'
```


Sample code to get status for job 1. This url is sent in the header of the response for $import request above 

```javascript
curl -X GET \
  http://localhost:5000/status/1 \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  ```
