#!/bin/bash

echo "> Installing FHIR Bundle Caluclator CLI..."
npm install -g fhir-bundle-calculator

echo "> Cloning FHIR Generated Patients..."
git clone https://github.com/projecttacoma/fhir-patient-generator.git

echo "> Fetching CQF-tooling JAR"
./travis/download_cqf_tooling.sh

echo "> Rebuilding Bundles"
./travis/rebuild_bundles.sh