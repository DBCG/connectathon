#!/usr/bin/env bash

#   ./updatecodesystems.sh
#       This will update all valuesets
#   ./updatecodesystems.sh http://localhost:8080/cqf-ruler/baseDstu3
#       This will call updateCodeSystems to update valuesets on the specified server

BASE_URL=${1:-http://fhir.alphora.com/cqf-ruler/baseDstu3}

NEXT_URL="${BASE_URL}/ValueSet?_summary=true"

echo "${NEXT_URL}"

function updateValueSet() {
    echo "Updating ValueSet ${1}"
    curl "$BASE_URL/ValueSet/$1/\$updateCodeSystems" \
    -H "Accept: application/json"
}

while [ -n "$NEXT_URL" ]
do
VALUE_SETS=$(curl "$NEXT_URL" -H "Accept: application/json")
NEXT_URL=$(echo "$VALUE_SETS" | jq -r '.link[]? | select(.relation=="next") | .url')
VALUE_SET_IDS=$(echo "$VALUE_SETS" | jq -r '.entry[]?.resource.id')
IFS=$'\n' read -rd '' -a ID_ARRAY <<< "$VALUE_SET_IDS"
    for i in "${ID_ARRAY[@]}"
    do
    updateValueSet $i
    done

echo "$NEXT_URL"
done
