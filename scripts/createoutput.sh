#!/usr/bin/env bash

MEASURE=${1:-measure-col}
YEAR=${2:-2017}

directory=../results/$MEASURE/$MEASURE-$YEAR-patient
if [ ! -d "$directory" ]
then
    echo "$directory not found. Exiting"
    exit
fi

file=../results/$MEASURE/$MEASURE-$YEAR-report.txt
if [ -f "$file" ]
then
    rm $file
fi

function get_population_status() {
    jq -r --arg population $1 '.report.group[0].population[] | select(.identifier.value == $population) | (.count > 0)' $2
}


function output() {
    jq -r '.patient | "\(.id)\t\(.name)\t\(.gender)\t\(.birthDate)"' $1
    echo $MEASURE$'\t''Initial Population'$'\t'$(get_population_status "initial-population" $1)
    echo $MEASURE$'\t''Numerator'$'\t'$(get_population_status "numerator" $1)
    echo $MEASURE$'\t''Denominator'$'\t'$(get_population_status "denominator" $1)
    jq -r 'select(.report.contained !=null) | .report.contained[0].entry[] | select(.resource.resourceType=="Observation") | "\(.resource.resourceType)\t\(.resource.id)\t\(.resource.effectiveDateTime)\t\(.resource.code.coding[0].system)\t\(.resource.code.coding[0].code)\t\(.resource.category[0].coding[0].display)"' $1
    jq -r 'select(.report.contained !=null) | .report.contained[0].entry[] | select(.resource.resourceType=="DiagnosticReport") | "\(.resource.resourceType)\t\(.resource.id)\t\(.resource.issued)\t\(.resource.code.coding[0].system)\t\(.resource.code.coding[0].code)\t\(.resource.code.coding[0].display)"' $1
    echo $'\n'
}


for i in $directory/*
do
    output $i >> $file
done


