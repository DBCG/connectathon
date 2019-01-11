#!/usr/bin/env bash

MEASURE=${1:-measure-col}
YEAR=${2:-2017}
BASE_URL=${3:-http://localhost:8080/cqf-ruler/baseDstu3}

file=./results/$MEASURE-$YEAR.json
if [ ! -f $file ]
then
	echo "$file not found. Exiting"
    exit
fi

directory=./results/$MEASURE-$YEAR-patient
if [ -d $directory ]
then
    rm -r -f $directory
fi
	
mkdir $directory

function get_list_id() {
    jq ".group[0].population[] | select(.identifier.value==\"$1\") | .patients.reference" $file |  tr -d '"#'
}

POPULATION_ID=$(get_list_id "initial-population")
echo "Initial Population $POPULATION_ID"

NUMERATOR_ID=$(get_list_id "numerator")
echo "Numerator $NUMERATOR_ID"

DENOMINATOR_ID=$(get_list_id "denominator")
echo "Denominator $DENOMINATOR_ID"


function get_patient_ids() {
    jq ".contained[] | select(.id==\"$1\") | .entry[].item.reference" $file |  tr -d '"' | cut -d/ -f3
}

function get_patient_info() {
    curl -sS "$BASE_URL/Patient/$1?_format=json" -H "Accept: application/json" \
    | jq '{resourceType : "Patient", id, name : ((.name[0].given | join(" ")) + " " + (.name[0].family)), gender, birthDate}'
}


CQL=$(cat col-logic.cql)

function get_measure_result() {
    curl -sS "$BASE_URL/Measure/$MEASURE/\$evaluate-measure?patient=$1&periodStart=$YEAR-01-01&periodEnd=$YEAR-12-31&_format=json" \
    -H "Accept: application/json" \
    -H "Content-Type:application/json" \
    | jq '.' #jq -C '.[] | select(.resultType=="Boolean") | { name, result }'
}

# Only need the initial population for now. We'll run the cql for each patient directly to capture the output.
IDS=($(get_patient_ids $POPULATION_ID))
for i in ${IDS[@]}
do
    echo "Getting Patient Info $i"
    echo "[" >> $directory/$i.json
	echo $(get_patient_info $i) >> $directory/$i.json
    echo "," >> $directory/$i.json
    echo "Getting Measure Report $i"
    echo $(get_measure_result $i) >> $directory/$i.json
    echo "]" >> $directory/$i.json
done