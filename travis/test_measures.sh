#!/bin/bash

echo "> Rebuilding Measure Bundles"
./travis/rebuild_bundles.sh

cd fhir-patient-generator

# Use make commands to test measures and/or
# compare calculation results against the
# existing patient sets.
