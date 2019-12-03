#!/usr/bin/env bash

MEASURE=${1:-measure-col}
YEAR=${2:-2017}
BASE_URL=${3:-http://localhost:8080/cqf-ruler/baseDstu3}

directory=../results/$MEASURE
if [ -d "$directory" ]
then
    rm -r -f $directory
fi
    
mkdir -p $directory



echo "Evaluating $MEASURE for $YEAR on $BASE_URL"
curl "$BASE_URL/Measure/$MEASURE/\$evaluate-measure?reportType=patient-list&periodStart=$YEAR-01-01&periodEnd=$YEAR-12-31&_format=json" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-o "$directory/$MEASURE-$YEAR.json"


# http://localhost:8080/cqf-ruler/baseDstu3/Measure/measure-col/$evaluate-measure?reportType=patient-list&periodStart=2017-01-01&periodEnd=2017-12-31&_format=json

# http://localhost:8080/cqf-ruler/baseDstu3/Measure/measure-col/$evaluate-measure?patient=Patient-487&periodStart=2017-01-01&periodEnd=2017-12-31&_format=json

