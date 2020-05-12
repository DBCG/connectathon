#!/bin/bash

echo "> Cloning FHIR Generated Patients..."
git clone --single-branch --branch exm_506-recalculate https://github.com/projecttacoma/fhir-patient-generator.git

echo "> Fetching CQF-tooling JAR"
./travis/download_cqf_tooling.sh

echo "> Setting Up cqf-ruler docker instance"
docker pull contentgroup/cqf-ruler:develop
docker run --name cqf-ruler --rm -dit -p 8080:8080 contentgroup/cqf-ruler:develop

echo "> Waiting for cqf-ruler to start up"
until `curl --output /dev/null --silent --head --fail http://localhost:8080/cqf-ruler-r4`; do printf '.'; sleep 5; done

# grab the status code and error the setup if it isn't 200
statusCode=`curl -s -o /dev/null -L -I -w "%{http_code}" http://localhost:8080/cqf-ruler-r4`
if [[ "$statusCode" != "200" ]]; then
  echo "X cqf-ruler has failed to start up properly"
  exit 1
fi