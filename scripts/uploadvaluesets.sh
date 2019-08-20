#!/usr/bin/env bash

#  THIS SCRIPT OVERWRITES EXISTING DATA
#    ./uploadvaluesets.sh
#        This will upload all valuesets
#    ./uploadvaluesets.sh http://localhost:8080/cqf-ruler/baseDstu3
#        This will upload all valuesets to the specified server

BASE_URL=${1:-http://fhir.alphora.com/cqf-ruler/baseDstu3}

JQ_PROGRAM='. | .entry[]?.resource?.compose?.include[]?.system |= if . == $old then $new else . end'

for f in ../resources/valuesets/*.json;
do

echo 'Cleaning ' "$f";
JSON=$(cat "$f" \
| jq --arg old "http://www.ama-assn.org/go/cpt" --arg new "CPT" "$JQ_PROGRAM" \
| jq --arg old "http://hl7.org/fhir/sid/icd-9-cm" --arg new "ICD-9-CM" "$JQ_PROGRAM" \
| jq --arg old "http://hl7.org/fhir/sid/icd-10-us" --arg new "ICD-10-CM" "$JQ_PROGRAM" \
| jq --arg old "http://www.icd10data.com/icd10pcs" --arg new "ICD-10-PCS" "$JQ_PROGRAM" \
| jq --arg old "http://www.ama-assn.org/go/hcpcs" --arg new "HCPCS" "$JQ_PROGRAM" \
| jq --arg old "https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/index.html" --arg new "HCPCS" "$JQ_PROGRAM" \
| jq --arg old "http://snomed.info/sct" --arg new "SNOMED CT US Edition" "$JQ_PROGRAM" \
| jq --arg old "http://loinc.org" --arg new "LOINC" "$JQ_PROGRAM" \
| jq --arg old "http://www.nubc.org/patient-discharge" --arg new "UBREV" "$JQ_PROGRAM" \
| jq --arg old "http://hl7.org/fhir/claimcareteamrole" --arg new "http://hl7.org/fhir/claimcareteamrole" "$JQ_PROGRAM" \
| jq --arg old "http://www.nlm.nih.gov/research/umls/rxnorm" --arg new "RXNORM" "$JQ_PROGRAM" \
| jq --arg old "CMS Specialty" --arg new "CMS Specialty" "$JQ_PROGRAM" \
| jq --arg old "http://nucc.org/provider-taxonomy" --arg new "Provider Taxonomy" "$JQ_PROGRAM" \
| jq --arg old "http://hl7.org/fhir/sid/cvx" --arg new "CVX" "$JQ_PROGRAM" \
| jq --arg old "http://terminology.hl7.org/fhir/CodeSystem/medicationdispense-category" --arg new "NDC HEDIS 2019" "$JQ_PROGRAM" \
| jq --arg old "http://hl7.org/fhir/sid/ndc" --arg new "NDC" "$JQ_PROGRAM" \
)

echo 'Posting' "$f";

curl "$BASE_URL" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST \
--data @<(echo "$JSON")
done
