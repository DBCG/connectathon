#!/bin/bash

echo "> Rebuilding Measure Bundles"
if ! ./travis/rebuild_bundles.sh; then
  exit 1
fi

cd fhir-patient-generator
make all CI_TOOL=true

# Use make commands to test measures and/or
# compare calculation results against the
# existing patient sets.
