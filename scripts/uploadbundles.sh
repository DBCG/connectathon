#!/usr/bin/env bash

BASE_URL=${1:-http://localhost:8080/cqf-ruler/baseDstu3}


# echo 'Loading FHIR Helpers'
# curl "$BASE_URL/Library/FHIRHelpers" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X PUT \
# --data @<(cat ../examples/libraries/FhirHelpers_v3.0.0-library.json)

# echo 'Posting All CQM Bundle'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ./all-cqm-bundle.json)

# echo 'Posting All CMS CQM Bundle'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ./all-cms-cqm-bundle.json)

# echo 'Posting Network'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ./network-bundle.json)

# echo 'Posting Patient'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ./patient-bundle.json)

# for f in ./histories/**/*.json; 
# do 
# echo 'Posting' "$f";
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat "$f")
# done


echo 'Posting Endpoint and Caching Valuesets'
curl "$BASE_URL" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST \
--data @<(cat ./cache-terminology-bundle.json)


# ack --output='$1' -h --nogroup "valueset.*:\s*'([0-9.]*)'" . | sort | uniq -u > valuesets.txt
# while read line; do echo "{'request': { 'method' : 'GET','url': 'Endpoint/fhir-ext-apelon-com/\$cache-valuesets?valuesets=$line&user=brhodes&pass=BR123!'}}" >> exported.txt; done < valuesets.txt;
# jq -C '.entry[] | .resource.id' valuesets.json
# q  -r '.entry[] | .resource.id' valuesets.json | whileread line; do echo "$line"; done




# echo 'Posting Terminology'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ../src/test/resources/org/opencds/cqf/measure-evaluation/hedis-terminology-bundle.json)
