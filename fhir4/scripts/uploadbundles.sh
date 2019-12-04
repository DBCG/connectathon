#!/usr/bin/env bash

BASE_URL=${1:-http://localhost:8080/cqf-ruler/baseDstu3}

echo 'Loading FHIR Helpers'
curl "$BASE_URL/Library/FHIRHelpers" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X PUT \
--data @<(cat ../bundles/FhirHelpers_v3.0.0-library.json)

# echo 'Posting All CQM Bundle'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ../bundles/all-cqm-bundle.json)

# echo 'Posting All CMS CQM Bundle'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ../bundles/all-cms-cqm-bundle.json)

# echo 'Posting Network'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ../bundles/network-bundle.json)

# echo 'Posting Patient'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ../bundles/patient-bundle.json)

# for f in ../bundles/histories/**/*.json; 
# do 
# echo 'Posting' "$f";
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat "$f")
# done


# Connectathon
# echo 'Posting Endpoint and Caching Valuesets'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ../bundles/cache-terminology-bundle.json) > term-output.txt


# Local bundles
# echo 'Posting Hedis terminology bundle'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ../../cqf-ruler/src/test/resources/org/opencds/cqf/measure-evaluation/hedis-terminology-bundle.json)

# echo 'Posting Hedis Practioner ValueSet'
# curl "$BASE_URL/ValueSet/hedis-med-rec-practitioner" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X PUT \
# --data @<(cat ../../hedis-ig/resources/valueset/valueset-hedis-med-rec-practitioner.json)

# echo 'Posting QDM terminology bundle'
# curl "$BASE_URL" \
# -H "Accept: application/json" \
# -H "Content-Type:application/json" \
# -X POST \
# --data @<(cat ../../cqf-ruler/src/test/resources/org/opencds/cqf/qdm-data-provider/qdm-terminology-bundle.json)