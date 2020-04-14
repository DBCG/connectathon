#!/bin/bash

echo "> Cloning FHIR Generated Patients..."
git clone https://github.com/projecttacoma/fhir-patient-generator.git

echo "> Fetching CQF-tooling JAR"
./travis/download_cqf_tooling.sh

