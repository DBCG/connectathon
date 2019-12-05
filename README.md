# HL7 FHIR Connectathon 22

Resources for use at HL7 FHIR Connectathon 22, Clinical Reasoning Track.

* [Track Description](https://confluence.hl7.org/display/FHIR/2019-09+Clinical+Reasoning+Track)
* [Zulip Stream](https://chat.fhir.org/#narrow/stream/179207-connectathon-mgmt/topic/Clinical.20Reasoning.20Track)

* CQF-Ruler Docker Container:

```
docker run -p 8080:8080 contentgroup/cqf-ruler
```

## Measure Reporting Scenarios

****
NOTE: fhir4 is undergoing maintenance.  Links may be broken.
****

### Controlling Blood Pressure - EXM165

#### FHIR3

* [Measure CQL](fhir3/cql/EXM165_FHIR3-8.5.000.cql)
* [Measure Bundle](fhir3/resources/measure/measure-EXM165_FHIR3-8.5.000.json)
* [Terminology Bundle](fhir3/resources/valuesets/valuesets-EXM165_FHIR3-8.5.000-bundle.json)
* [Test Bundle](fhir3/tests/EXM165_FHIR3-8.5.000/tests-EXM165-FHIR3-8.5.000-bundle.json)
    * Denominator Patient ID: f4bd2b01-bf58-494b-85be-842e4961a3a5-1
    * Numerator Patient ID: bc4159a4-6ff2-4a5b-be3a-d9c4778642c2-1

#### FHIR4

* [Measure CQL](fhir4/cql/EXM165_FHIR4-8.5.000.cql)
* [Measure Bundle](fhir4/bundles/exm165-fhir4-bundle.json)
* [Terminology Bundle](fhir4/resources/valuesets/valuesets-bundle-exm165-FHIR.json)
* [Denominator Patient (ID: 7c897218-9ee1-4c51-a1f8-ecfb1e22677c)](fhir4/tests/EXM165/cms165-r4-denom.json)
* [Numerator Patient (ID: 50952b5c-3ed6-4fb4-802a-a72d55deebdb)](fhir4/tests/EXM165/cms165-r4-numer.json)

### Cervical Cancer Screening - EXM124

#### FHIR3

* [Measure CQL](fhir3/cql/EXM124_FHIR3-7.2.000.cql)
* [Measure Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/full-EXM124_FHIR3-7.2.000-bundle.json)
* [Terminology Bundle](fhir3/resources/valuesets/valuesets-EXM124_FHIR3-7.2.000-bundle.json)
* [Test Bundle](fhir3/tests/EXM124_FHIR3-7.2.000/tests-EXM124-FHIR3-7.2.000-bundle.json)
    * Denominator Patient ID: denom-EXM124-FHIR3
    * Numerator Patient ID: numer-EXM124-FHIR3
* [Denominator Measure Report (ID: denom-EXM124-FHIR3)](fhir3/output/expected-results/measurereport-EXM124-FHIR3-7.2.000-denom.json)
* [Numerator Measure Report (ID: numer-EXM124-FHIR3)](fhir3/output/expected-results/measurereport-EXM124-FHIR3-7.2.000-numer.json)

#### FHIR4

* [Measure CQL](fhir4/cql/EXM124_FHIR4-7.2.000.cql)
* [Measure Bundle](fhir4/bundles/exm124-fhir4-bundle.json)
* [Terminology Bundle](fhir4/resources/valuesets/valuesets-bundle-exm124-FHIR.json)
* [Denominator Patient (ID: 8ce4913e-4b06-4914-a43b-ec45b53850e5-1)](fhir4/tests/EXM124/cms124-r4-denom.json)
* [Numerator Patient (ID: 33aff086-02fb-47ef-a802-be26266ca906-1)](fhir4/tests/EXM124/cms124-r4-numer.json)

### Breast Cancer Screening - EXM125

#### FHIR3

* [Measure CQL](fhir3/cql/EXM125_FHIR3-7.2.000.cql)
* [Measure Bundle](fhir3/resources/measure/measure-EXM125_FHIR3-7.2.000.json)
* [Terminology Bundle](fhir3/resources/valuesets/valuesets-EXM125_FHIR3-7.2.000-bundle.json)
* [Test Bundle](fhir3/tests/EXM125_FHIR3-7.2.000/tests-EXM125-FHIR3-7.2.000-bundle.json)
    * Denominator Patient ID: cbb3375f-0962-4f31-8681-c7e6f29968dd-1
    * Numerator Patient ID: e57e9bae-ee0e-4374-9453-d185a74800ab-1

#### FHIR4

* [Measure CQL](fhir4/cql/EXM125_FHIR4-7.2.000.cql)
* [Measure Bundle](fhir3/resources/measure/measure-exm125-FHIR.json)
* [Terminology Bundle](fhir3/resources/valuesets/valuesets-bundle-exm125-FHIR.json)
* [Denominator Patient (ID: f88fb40d-f95c-4ce0-87c2-bbda26bf184f-1)](fhir4/tests/EXM125/cms125-r4-denom.json)
* [Numerator Patient (ID: 6b296a65-31b6-4feb-99e2-3f5ecab670a3-1)](fhir4/tests/EXM125/cms125-r4-numer.json)

### Colorectal Cancer Screening - EXM130

#### FHIR3

* [Measure CQL](fhir3/cql/EXM130_FHIR3-7.2.000.cql)
* [Measure Bundle](fhir3/resources/measure/measure-EXM130_FHIR3-7.2.000.json)
* [Terminology Bundle](fhir3/resources/valuesets/valuesets-EXM130_FHIR3-7.2.000-bundle.json)
* [Test Bundle](fhir3/tests/EXM130_FHIR3-7.2.000/tests-EXM130-FHIR3-7.2.000-bundle.json)
    * Denominator Patient ID: 18019e78-0582-464d-8584-335dc7ba4f95-1
    * Numerator Patient ID: a7720bd3-49ab-4b22-aa05-1ed0f8a16d29-1

#### FHIR4

* [Measure CQL](fhir4/cql/EXM130_FHIR4-7.2.000.cql)
* [Measure Bundle](fhir4/bundles/exm130-fhir4-bundle.json)
* [Terminology Bundle](fhir4/resources/valuesets/valuesets-bundle-exm130-FHIR.json)
* [Denominator Patient (ID: a7720bd3-49ab-4b22-aa05-1ed0f8a16d29-1)](fhir4/tests/EXM130/cms130-R4-denom.json)
* [Numerator Patient (ID: 36f77e73-2190-4afe-a7c3-f3eb0ee1c855-1)](fhir4/tests/EXM130/cms130-R4-numer.json)

### Venous Thromboembolism Prophylaxis - EXM108

#### FHIR3

* [Measure CQL](fhir3/cql/EXM108_FHIR3-7.4.000.cql)
* [Measure Bundle](fhir3/resources/measure/measure-EXM108_FHIR3-7.4.000.json)
* [Terminology Bundle](fhir3/resources/valuesets/valuesets-EXM108_FHIR3-7.4.000-bundle.json)
* [Test Bundle](fhir3/tests/EXM108_FHIR3-7.4.000/tests-EXM108-FHIR3-7.4.000-bundle.json)
    * Denominator Patient ID: denom-EXM108-FHIR3
    * Numerator Patient ID: numer-EXM108-FHIR3

#### FHIR4

* [Measure CQL](fhir4/cql/EXM108_FHIR4-7.4.000.cql)
* [Measure Bundle](fhir4/bundles/exm108-fhir4-bundle.json)
* [Terminology Bundle](fhir4/resources/valuesets/valuesets-bundle-exm108-FHIR.json)
* [Denominator Patient (ID: XX1e0b4c13-7445-4316-b5f5-19e24ada9861XX)](fhir4/tests/EXM108/cms108-r4-denom.json)
* [Numerator Patient (ID: a3a265b0-be81-4613-8a63-67b98748eb32)](fhir4/tests/EXM108/cms108-r4-numer.json)

### Discharged on Antithrombotic Therapy - EXM104

#### FHIR3

* [Measure CQL](fhir3/cql/EXM104_FHIR3-8.1.000.cql)
* [Measure Bundle](fhir3/resources/measure/measure-EXM104_FHIR3-8.1.000.json)
* [Terminology Bundle](fhir3/resources/valuesets/valuesets-EXM104_FHIR3-8.1.000-bundle.json)
* [Test Bundle](fhir3/tests/EXM104_FHIR3-8.1.000/tests-EXM104-FHIR3-8.1.000-bundle.json)
    * Denominator Patient ID: denom-EXM104-FHIR3
    * Numerator Patient ID: numer-EXM104-FHIR3

#### FHIR4

* [Measure CQL](fhir4/cql/EXM104_FHIR4-8.1.000.cql)
* [Measure Bundle](fhir4/bundles/exm72-fhir4-bundle.json)
* [Terminology Bundle](fhir4/resources/valuesets/valuesets-bundle-exm104-FHIR.json)
* [Denominator Patient (ID: d2083276-0074-4015-9cd8-cfd669bd3a41)](fhir4/tests/EXM104/cms104-r4-denom.json)
* [Numerator Patient (ID: 5d066aba-f26b-48c5-8c2c-689267cb6cc8)](fhir4/tests/EXM104/cms104-r4-numer.json)

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

## Maintenance Conventions

* IDs
  * Context ID (Patient ID): [test name]-[id]-[1]
    * ex: Denom-98ce13ee-450b-43ca-9fbe-08b05999532b-1
  * Child ID: [context id]-[number]
    * ex: Denom-98ce13ee-450b-43ca-9fbe-08b05999532b-2

This repository contains a directory for each supported version of FHIR. Within each
FHIR directory, there are directories for CQL source, resources, and tests, according
to the following conventions:

* CQL files
  * File names: [library name]-[library version]
    * ex: EXM124_FHIR3-7.2.000.cql
    * note: this must match the library `name` and `version` in the CQL content

```
  |-- fhir3
      |-- cql
          |-- EXM124_FHIR3-7.2.000.cql
          |-- EXM125_FHIR3-7.2.000.cql
  |-- fhir4
      |-- cql
          |-- EXM124_FHIR4-7.2.000.cql
          |-- EXM125_FHIR4-7.2.000.cql
```

* Test files
  * Root name: tests
  * Library test folder names: [cql library name]
    * ex: EXM124_FHIR3
  * CQL test folder names: [context id]
    * ex: Denom-98ce13ee-450b-43ca-9fbe-08b05999532b-1
    * note: this must match the Context ID for the CQL Library (usually the ID of the Patient resource)
  * Resource folder names: [resource name]
    * ex: Encounter
  * Test file names: [id]
    * ex: Denom-98ce13ee-450b-43ca-9fbe-08b05999532b-1.json
    * note: this must match the id of the resource file

```
    |-- fhir3
        |-- tests
        |   |-- EXM124_FHIR3
        |   |   |-- Denom-5649e34d-df03-498f-9c82-4087bb5a2a46-1
        |   |   |   |-- Patient
        |   |   |   |   |-- Denom-5649e34d-df03-498f-9c82-4087bb5a2a46-1.json
        |   |   |   |-- Encounter
        |   |   |       |-- Denom-5649e34d-df03-498f-9c82-4087bb5a2a46-2.json
        |   |   |-- Numer-98ce13ee-450b-43ca-9fbe-08b05999532b-1
        |   |       |-- Patient
        |   |       |   |-- Denom-98ce13ee-450b-43ca-9fbe-08b05999532b-1.json
        |   |       |-- Encounter
        |   |           |-- Denom-98ce13ee-450b-43ca-9fbe-08b05999532b-2.json
        |   |-- EXM125_FHIR3
    |-- fhir4
        |-- tests

```          
