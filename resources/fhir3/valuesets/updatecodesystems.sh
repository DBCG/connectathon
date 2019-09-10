#!/bin/bash

# ./updatecodesystems.sh  to upload all valuesets
# ./updatecodesystems.sh http://localhost:8080/cqf-ruler/baseDstu3 to upload to your specific server

BASE_URL=${1:-http://localhost:8080/cqf-ruler/baseDstu3}


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