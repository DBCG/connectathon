# HL7 FHIR Connectathon 22

Resources for use at HL7 FHIR Connectathon 22, Clinical Reasoning Track.

* [Track Description](https://confluence.hl7.org/display/FHIR/2019-09+Clinical+Reasoning+Track)
* [Zulip Stream](https://chat.fhir.org/#narrow/stream/179207-connectathon-mgmt/topic/Clinical.20Reasoning.20Track)

* CQF-Ruler Docker Container:

```
docker run -p 8080:8080 contentgroup/cqf-ruler
```

## Measure Reporting Scenarios

### Controlling Blood Pressure - EXM165

#### FHIR3

* [Measure CQL](cql/fhir3/EXM165_FHIR3-8.5.000.cql)
* [Measure Bundle](resources/fhir3/measure/measure-exm165-FHIR.json)
* [Terminology Bundle](resources/fhir3/valuesets/valuesets-bundle-exm165-FHIR.json)
* [Denominator Patient (ID: f4bd2b01-bf58-494b-85be-842e4961a3a5)](tests/fhir3/EXM165/cms165-stu3-denom.json)
* [Numerator Patient (ID: bc4159a4-6ff2-4a5b-be3a-d9c4778642c2)](tests/fhir3/EXM165/cms165-stu3-numer.json)
* [Denominator Measure Report (ID: f4bd2b01-bf58-494b-85be-842e4961a3a5)](output/mrp/fhir3/EXM165/cms165-stu3-denom.json)
* [Numerator Measure Report (ID: bc4159a4-6ff2-4a5b-be3a-d9c4778642c2)](output/mrp/fhir3/EXM165/cms165-stu3-numer.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM165_FHIR4-8.5.000.cql)
* [Measure Bundle](bundles/fhir4/exm165-fhir4-bundle.json)
* [Terminology Bundle](resources/fhir4/valuesets/valuesets-bundle-exm165-FHIR.json)
* [Denominator Patient (ID: 7c897218-9ee1-4c51-a1f8-ecfb1e22677c)](tests/fhir4/EXM165/cms165-r4-denom.json)
* [Numerator Patient (ID: 50952b5c-3ed6-4fb4-802a-a72d55deebdb)](tests/fhir4/EXM165/cms165-r4-numer.json)

### Cervical Cancer Screening - EXM124

#### FHIR3

* [Measure CQL](cql/fhir3/EXM124_FHIR3-7.2.000.cql)
* [Measure Bundle](resources/fhir3/measure/measure-exm124-FHIR.json)
* [Terminology Bundle](resources/fhir3/valuesets/valuesets-bundle-exm124-FHIR.json)
* [Denominator Patient (ID: 5649e34d-df03-498f-9c82-4087bb5a2a46-1)](tests/fhir3/EXM124/cms124-STU3-denom.json)
* [Numerator Patient (ID: 98ce13ee-450b-43ca-9fbe-08b05999532b-1)](tests/fhir3/EXM124/cms124-STU3-numer.json)
* [Denominator Measure Report (ID: 5649e34d-df03-498f-9c82-4087bb5a2a46-1)](output/mrp/fhir3/EXM124/cms124-STU3-denom.json)
* [Numerator Measure Report (ID: 98ce13ee-450b-43ca-9fbe-08b05999532b-1)](output/mrp/fhir3/EXM124/cms124-STU3-numer.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM124_FHIR4-7.2.000.cql)
* [Measure Bundle](bundles/fhir4/exm124-fhir4-bundle.json)
* [Terminology Bundle](resources/fhir4/valuesets/valuesets-bundle-exm124-FHIR.json)
* [Denominator Patient (ID: 8ce4913e-4b06-4914-a43b-ec45b53850e5-1)](tests/fhir4/EXM124/cms124-r4-denom.json)
* [Numerator Patient (ID: 33aff086-02fb-47ef-a802-be26266ca906-1)](tests/fhir4/EXM124/cms124-r4-numer.json)

### Breast Cancer Screening - EXM125

#### FHIR3

* [Measure CQL](cql/fhir3/EXM125_FHIR3-7.2.000.cql)
* [Measure Bundle](resources/fhir3/measure/measure-exm125-FHIR.json)
* [Terminology Bundle](resources/fhir3/valuesets/valuesets-bundle-exm125-FHIR.json)
* [Denominator Patient (ID: cbb3375f-0962-4f31-8681-c7e6f29968dd-1)](tests/fhir3/EXM125/cms125-STU3-denom.json)
* [Numerator Patient (ID: e57e9bae-ee0e-4374-9453-d185a74800ab-1)](tests/fhir3/EXM125/cms125-STU3-numer.json)
* [Denominator Measure Report (ID: cbb3375f-0962-4f31-8681-c7e6f29968dd-1)](output/mrp/fhir3/EXM125/cms125-STU3-denom.json)
* [Numerator Measure Report (ID: e57e9bae-ee0e-4374-9453-d185a74800ab-1)](output/mrp/fhir3/EXM125/cms125-STU3-numer.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM125_FHIR4-7.2.000.cql)
* [Measure Bundle](resources/fhir3/measure/measure-exm125-FHIR.json)
* [Terminology Bundle](resources/fhir3/valuesets/valuesets-bundle-exm125-FHIR.json)
* [Denominator Patient (ID: f88fb40d-f95c-4ce0-87c2-bbda26bf184f-1)](tests/fhir4/EXM125/cms125-r4-denom.json)
* [Numerator Patient (ID: 6b296a65-31b6-4feb-99e2-3f5ecab670a3-1)](tests/fhir4/EXM125/cms125-r4-numer.json)

### Colorectal Cancer Screening - EXM130

#### FHIR3

* [Measure CQL](cql/fhir3/EXM130_FHIR3-7.2.000.cql)
* [Measure Bundle](resources/fhir3/measure/measure-exm130-FHIR.json)
* [Terminology Bundle](resources/fhir3/valuesets/valuesets-bundle-exm130-FHIR.json)
* [Denominator Patient (ID: 18019e78-0582-464d-8584-335dc7ba4f95-1)](tests/fhir3/EXM130/cms130-STU3-denom.json)
* [Numerator Patient (ID: a7720bd3-49ab-4b22-aa05-1ed0f8a16d29-1)](tests/fhir3/EXM130/cms130-STU3-numer.json)
* [Denominator Measure Report (ID: 18019e78-0582-464d-8584-335dc7ba4f95-1)](output/mrp/fhir3/EXM130/cms130-STU3-denom.json)
* [Numerator Measure Report (ID: a7720bd3-49ab-4b22-aa05-1ed0f8a16d29-1)](output/mrp/fhir3/EXM130/cms130-STU3-numer.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM130_FHIR4-7.2.000.cql)
* [Measure Bundle](bundles/fhir4/exm130-fhir4-bundle.json)
* [Terminology Bundle](resources/fhir4/valuesets/valuesets-bundle-exm130-FHIR.json)
* [Denominator Patient (ID: a7720bd3-49ab-4b22-aa05-1ed0f8a16d29-1)](tests/fhir4/EXM130/cms130-R4-denom.json)
* [Numerator Patient (ID: 36f77e73-2190-4afe-a7c3-f3eb0ee1c855-1)](tests/fhir4/EXM130/cms130-R4-numer.json)

### Venous Thromboembolism Prophylaxis - EXM108

#### FHIR3

* [Measure CQL](cql/fhir3/EXM108_FHIR3-7.4.000.cql)
* [Measure Bundle](bundles/fhir3/exm108-fhir3-bundle.json)
* [Terminology Bundle](resources/fhir3/valuesets/valuesets-bundle-exm108-FHIR.json)
* [Denominator Patient (ID: XXba6f00b1-9006-41ae-8a98-87e3d1c76bc4X)](tests/fhir3/EXM108/cms108-stu3-denom.json)
* [Numerator Patient (ID: d16ee9db-aa9b-46c8-a75d-47282b241b60)](tests/fhir3/EXM108/cms108-stu3-numer.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM108_FHIR4-7.4.000.cql)
* [Measure Bundle](bundles/fhir4/exm108-fhir4-bundle.json)
* [Terminology Bundle](resources/fhir4/valuesets/valuesets-bundle-exm108-FHIR.json)
* [Denominator Patient (ID: XX1e0b4c13-7445-4316-b5f5-19e24ada9861XX)](tests/fhir4/EXM108/cms108-r4-denom.json)
* [Numerator Patient (ID: a3a265b0-be81-4613-8a63-67b98748eb32)](tests/fhir4/EXM108/cms108-r4-numer.json)

### Discharged on Antithrombotic Therapy - EXM104

#### FHIR3

* [Measure CQL](cql/fhir3/EXM104_FHIR3-8.1.000.cql)
* [Measure Bundle](bundles/fhir3/exm104-fhir3-bundle.json)
* [Terminology Bundle](resources/fhir3/valuesets/valuesets-bundle-exm104-FHIR.json)
* [Denominator Patient (ID: 2019648f-97fd-42d1-9b81-7b1b71eddb8b)](tests/fhir3/EXM104/cms104-stu3-denom.json)
* [Numerator Patient (ID: 35e045bf-080c-4bbb-9afb-4d144e17307e)](tests/fhir3/EXM104/cms104-stu3-numer.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM104_FHIR4-8.1.000.cql)
* [Measure Bundle](bundles/fhir4/exm72-fhir4-bundle.json)
* [Terminology Bundle](resources/fhir4/valuesets/valuesets-bundle-exm104-FHIR.json)
* [Denominator Patient (ID: d2083276-0074-4015-9cd8-cfd669bd3a41)](tests/fhir4/EXM104/cms104-r4-denom.json)
* [Numerator Patient (ID: 5d066aba-f26b-48c5-8c2c-689267cb6cc8)](tests/fhir4/EXM104/cms104-r4-numer.json)

### Bulk Data Example

````
curl -X POST \
'http://3.90.39.179:5000/$import' \
-H 'Accept: application/fhir+json' \
-H 'Content-Type: application/json' \
-H 'Prefer: respond-async' \
-H 'Accept-Encoding: gzip, deflate' \
-H 'Cache-Control: no-cache' \
-H 'Connection: keep-alive' \
-d '{
"inputFormat": "application/fhir+ndjson",
"inputSource": "https://sample.s3.amazonaws.com/",
"storageDetail":
{
"type": "https"
},
"input": [
{
"type": "Patient",
"url": "https://sample.s3.amazonaws.com/Patient.ndjson"
}
]
}'
````

Example POST for a bulk data import pass-through. The expectation is that the passthrough proxy will post each line in the input file as a POST to the base if the resource type is Bundle, and as a POST to the resource type endpoint if the resource is any other type.
