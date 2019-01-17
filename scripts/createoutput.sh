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
    echo 'Initial Population'$'\t'$(get_population_status "initial-population" $1)
    echo 'Denominator'$'\t'$(get_population_status "denominator" $1)
    echo 'Numerator'$'\t'$(get_population_status "numerator" $1)
    jq -r '{ mapping: [(.report.contained[0].entry[] | select(.resource.resourceType=="List") | .resource | { title, resource: (.entry[].item.reference | split("/")[1])})], resources: [select(.report.contained !=null) | .report.contained[0].entry[] | select(.resource.resourceType!="List") | .resource? | { id, type:(.resourceType), system :(.code.coding[0].system), code: (.code.coding[0].code), display: (.code.coding[0].display), date: (.effectiveDateTime // .issued // .performedPeriod.start) } ] } | JOIN(INDEX((.mapping[]); .resource); (.resources[]); .id) | "\(.[1].title)\t\(.[0].type)\t\(.[0].id)\t\(.[0].system)\t\(.[0].code)\t\(.[0].date)\t"' $1
    echo $'\n'
}


for i in $directory/*
do
    output $i >> $file
done


