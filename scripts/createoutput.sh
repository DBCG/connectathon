#!/usr/bin/env bash

MEASURE=${1:-measure-col}
YEAR=${2:-2017}

directory=../results/$MEASURE-$YEAR-patient
if [ ! -d $directory ]
then
    echo "$file not found. Exiting"
    exit
fi


for i in $directory/*
do
    jq -r '.patient | "\(.id)\t\(.name)\t\(.gender)\t\(.birthDate)"' $i
    echo $MEASURE $'\t''Initial Population'$'\t''true'$'\t'
    echo $MEASURE $'\t''Denominator'$'\t''true'$'\t'
    echo $MEASURE $'\t''Numerator'$'\t''true'$'\t'
    jq -r '.report.contained[0].entry[] | select(.resource.resourceType=="Observation") | "\(.resource.resourceType)\t\(.resource.id)\t\(.resource.effectiveDateTime)\t\(.resource.code.coding[0].system)\t\(.resource.code.coding[0].code)\t\(.resource.category[0].coding[0].display)"' $i
    jq -r '.report.contained[0].entry[] | select(.resource.resourceType=="DiagnosticReport") | "\(.resource.resourceType)\t\(.resource.id)\t\(.resource.issued)\t\(.resource.code.coding[0].system)\t\(.resource.code.coding[0].code)\t\(.resource.code.coding[0].display)"' $i
    echo $'\n'
done