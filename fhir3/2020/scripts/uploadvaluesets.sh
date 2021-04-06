#!/usr/bin/env bash

#  THIS SCRIPT OVERWRITES EXISTING DATA
#    ./uploadvaluesets.sh
#        This will upload all valuesets
#    ./uploadvaluesets.sh http://localhost:8080/cqf-ruler/baseDstu3
#        This will upload all valuesets to the specified server

BASE_URL=${1:-http://fhir.alphora.com/cqf-ruler/baseDstu3}

JQ_PROGRAM='. | .entry[]?.resource?.compose?.include[]?.system |= if . == $old then $new else . end'

for f in ../resources/valuesets/*.json;
do

echo 'Cleaning ' "$f";
JSON=$(cat "$f" \
| jq --arg old "http://www.ama-assn.org/go/cpt" --arg new "CPT" "$JQ_PROGRAM" \
)

echo 'Posting' "$f";

curl "$BASE_URL" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST \
--data @<(echo "$JSON")
done
