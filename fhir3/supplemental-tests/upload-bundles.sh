#!/bin/sh

if [ -z "$1" ]
then
    echo 'Usage: ./upload-bundles.sh <directory>';
    exit 1;
fi

BASE_URL="http://localhost:8080/cqf-ruler-dstu3/fhir"

echo 'Posting numerator patients for:' "$1"
for bundle in ./$1/numerator/*.json;
do
    echo 'Posting bundle': "$bundle";
    curl -X POST -H "Content-Type: application/json" --data @$bundle $BASE_URL
done

echo 'Posting denominator patients for:' "$1"
for bundle in ./$1/denominator/*.json;
do
    echo 'Posting bundle': "$bundle";
    curl -X POST -H "Content-Type: application/json" --data @$bundle $BASE_URL
done

echo 'Done'
