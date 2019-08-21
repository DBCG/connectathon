#!/usr/bin/env bash

#   THIS SCRIPT OVERWRITES EXISTING DATA
#   Examples:
#     ./uploadtests.sh
#         This will upload all test resources - .json files found in the specified directories.
#     ./uploadtests.sh EXM124
#         This will upload EXM124 resources
#     ./uploadtests.sh "fhir3/EXM124" http://localhost:8080/cqf-ruler/baseDstu3
#         This will upload resources from the fhir3/EXM124 directory to the specified server.

TEST=${1:-**}
BASE_URL=${2:-http://fhir.alphora.com/cqf-ruler/baseDstu3}

for t in ../tests/$TEST/*.json;
do
echo 'Posting Test:' "$t";
curl "$BASE_URL" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST \
--data @<(cat "$t")
done
