```
NOTICE:  

The struture of the Connectathon repo is being updated to match conventions of other IGs to enable cross IG usage of the "refresh" tooling. 

The impact will be the following folder changes:
IS: 
   "cql/"
   "resources/library/"
   "resources/measure/"
   "resources/valuesets/"
   "tests/"
   
UPDATED TO:  
   "input/pagecontent/cql/"
   "input/resources/library/"
   "input/resources/measure/"
   "input/vocabulary/valueset/"
   "input/tests/"
   
 The updates are scheduled for release 2/15/2020.
 
 Please plan accordingly.
 
 Contact rob@alphora.com with any concerns.
 ```
 

# HL7 CMS/FHIR Connectathon

Resources for use at HL7/CMS FHIR Connectathon, Clinical Reasoning Track.

* [Track Description](https://confluence.hl7.org/display/FHIR/2020-01+CMS+FHIR+Connectathon+1)
* [Zulip Stream](https://chat.fhir.org/#narrow/stream/179207-connectathon-mgmt/topic/Clinical.20Reasoning.20Track)

* CQF-Ruler Docker Container:

```
docker pull contentgroup/cqf-ruler:develop
docker run -p 8080:8080 contentgroup/cqf-ruler:develop
```

## Measure Reporting Scenarios

### Controlling Blood Pressure - EXM165

#### FHIR3

* [Measure CQL](fhir3/cql/EXM165_FHIR3-8.5.000.cql)
* [Master Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-files/measure-EXM165_FHIR3-8.5.000.json)
* [Terminology Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-files/valuesets-EXM165_FHIR3-8.5.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-files/tests-denom-EXM165_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM165-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-files/tests-numer-EXM165_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM165-FHIR3

#### FHIR4

* [Measure CQL](fhir4/cql/EXM165_FHIR4-8.5.000.cql)
* [Master Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-files/measure-EXM165_FHIR4-8.5.000.json)
* [Terminology Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-files/valuesets-EXM165_FHIR4-8.5.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-files/tests-denom-EXM165_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM165-FHI4
* [Numerator Test Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-files/tests-numer-EXM165_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM165-FHIR4

### Cervical Cancer Screening - EXM124

#### FHIR3

* [Measure CQL](fhir3/cql/EXM124_FHIR3-7.2.000.cql)
* [Master Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-files/measure-EXM124_FHIR3-7.2.000.json)
* [Terminology Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-files/valuesets-EXM124_FHIR3-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-files/tests-denom-EXM124_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM124-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-files/tests-numer-EXM124_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM124-FHIR3

#### FHIR4

* [Measure CQL](fhir4/cql/EXM124_FHIR4-8.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/measure-EXM124_FHIR4-8.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/valuesets-EXM124_FHIR4-8.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/tests-denom-EXM124_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM124-FHI4
* [Numerator Test Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/tests-numer-EXM124_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM124-FHIR4

### Breast Cancer Screening - EXM125

#### FHIR3

* [Measure CQL](fhir3/cql/EXM125_FHIR3-7.2.000.cql)
* [Master Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-files/measure-EXM125_FHIR3-7.2.000.json)
* [Terminology Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-files/valuesets-EXM125_FHIR3-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-files/tests-denom-EXM125_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM125-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-files/tests-numer-EXM125_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM125-FHIR3

#### FHIR4

* [Measure CQL](fhir4/cql/EXM125_FHIR4-7.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/measure-EXM125_FHIR4-7.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/valuesets-EXM125_FHIR4-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/tests-denom-EXM125_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM125-FHI4
* [Numerator Test Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/tests-numer-EXM125_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM125-FHIR4

### Colorectal Cancer Screening - EXM130

#### FHIR3

* [Measure CQL](fhir3/cql/EXM130_FHIR3-7.2.000.cql)
* [Master Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-files/measure-EXM130_FHIR3-7.2.000.json)
* [Terminology Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-files/valuesets-EXM130_FHIR3-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-files/tests-denom-EXM130_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM130-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-files/tests-numer-EXM130_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM130-FHIR3

#### FHIR4

* [Measure CQL](fhir4/cql/EXM130_FHIR4-7.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/measure-EXM130_FHIR4-7.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/valuesets-EXM130_FHIR4-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/tests-denom-EXM130_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM130-FHI4
* [Numerator Test Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/tests-numer-EXM130_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM130-FHIR4

### Venous Thromboembolism Prophylaxis - EXM108

#### FHIR3

* [Measure CQL](fhir3/cql/EXM108_FHIR3-7.4.000.cql)
* [Master Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-files/measure-EXM108_FHIR3-7.4.000.json)
* [Terminology Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-files/valuesets-EXM108_FHIR3-7.4.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-files/tests-denom-EXM108_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM108-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-files/tests-numer-EXM108_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM108-FHIR3

#### FHIR4

* [Measure CQL](fhir4/cql/EXM108_FHIR4-8.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-files/measure-EXM108_FHIR4-8.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-files/valuesets-EXM108_FHIR4-8.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-files/tests-denom-EXM108_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM108-FHI4
* [Numerator Test Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-files/tests-numer-EXM108_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM108-FHIR4

### Discharged on Antithrombotic Therapy - EXM104

#### FHIR3

* [Measure CQL](fhir3/cql/EXM104_FHIR3-8.1.000.cql)
* [Master Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-files/measure-EXM104_FHIR3-8.1.000.json)
* [Terminology Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-files/valuesets-EXM104_FHIR3-8.1.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-files/tests-denom-EXM104_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM104-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-files/tests-numer-EXM104_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM104-FHIR3

#### FHIR4

* [Measure CQL](fhir4/cql/EXM104_FHIR4-8.1.000.cql)
* [Master Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-files/measure-EXM104_FHIR4-8.1.000.json)
* [Terminology Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-files/valuesets-EXM104_FHIR4-8.1.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-files/tests-denom-EXM104_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM104-FHI4
* [Numerator Test Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-files/tests-numer-EXM104_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM104-FHIR4

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
    * ex: denom-EXM124-FHIR3
    * note: this must match the Context ID for the CQL Library (usually the ID of the Patient resource)
  * Resource folder names: [resource name]
    * ex: Encounter
  * Test file names: [id]
    * ex: denom-EXM124-FHIR3.json
    * note: this must match the id of the resource file

```
    |-- fhir3
        |-- tests
        |   |-- EXM124_FHIR3-7.2.000
        |   |   |-- denom-EXM124-FHIR3
        |   |   |   |-- Patient
        |   |   |   |   |-- denom-EXM124-FHIR3.json
        |   |   |   |-- Encounter
        |   |   |       |-- denom-EXM124-FHIR3-1.json
        |   |   |-- numer-EXM124-FHIR3
        |   |       |-- Patient
        |   |       |   |-- denom-EXM125-FHIR3.json
        |   |       |-- Encounter
        |   |           |-- denom-EXM125-FHIR3-1.json
        |   |-- EXM125_FHIR3-7.2.000
    |-- fhir4
        |-- tests

```          
