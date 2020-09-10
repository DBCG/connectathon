# HL7 CMS/FHIR Connectathon

Resources for use at HL7/CMS FHIR Connectathon, Clinical Reasoning Track.

* [Track Description](https://confluence.hl7.org/display/FHIR/2020-05+Clinical+Reasoning)
* [Zulip Stream](https://chat.fhir.org/#narrow/stream/179207-connectathon-mgmt/topic/Clinical.20Reasoning.20Track)

* CQF-Ruler Docker Container:

Select a Docker Container that is appropriate for the verion of FHIR you are working with:

DSTU3/R4
```
docker pull contentgroup/cqf-ruler
docker run -p 8080:8080 contentgroup/cqf-ruler
```

R4.0.1
```
docker pull contentgroup/cqf-ruler:develop
docker run -p 8080:8080 contentgroup/cqf-ruler:develop
```

* Sandbox:

http://cqm-sandbox.alphora.com/cqf-ruler-r4/fhir/
The sandbox will be using the contentgroup/cqf-ruler:develop Docker Container which is approprioate for FHIR R4.0.1 work.
A sandbox willl not be provided for FHIR3 or FHIR4.  Please use the appropriate container to host your own instance.

* Postman Scripts:

[FHIR401](fhir401/docs/FHIR401.postman_collection.json)

## Measure Reporting Scenarios
```
Note: each FHIR version has been implemented as a separate IG.  Folder structures have changed to match.
```
```
Note: the FHIR version (FHIR3, FHIR4) has been removed from the naming convention for R4.0.1.
```


### Discharged on Antithrombotic Therapy - EXM104

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM104-8.2.000.cql)
* [Master Bundle](fhir401/bundles/EXM104-8.2.000/EXM104-8.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM104-8.2.000/EXM104-8.2.000-files/measure-EXM104-8.2.000.json)
* [Terminology Bundle](fhir401/bundles/EXM104-8.2.000/EXM104-8.2.000-files/valuesets-EXM104-8.2.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM104-8.2.000/EXM104-8.2.000-files/tests-denom-EXM104-bundle.json)
    * Denominator Patient ID: denom-EXM104
* [Numerator Test Bundle](fhir401/bundles/EXM104-8.2.000/EXM104-8.2.000-files/tests-numer-EXM104-bundle.json)
    * Numerator Patient ID: numer-EXM104

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM104_FHIR4-8.1.000.cql)
* [Master Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-files/measure-EXM104_FHIR4-8.1.000.json)
* [Terminology Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-files/valuesets-EXM104_FHIR4-8.1.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-files/tests-denom-EXM104_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM104-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM104_FHIR4-8.1.000/EXM104_FHIR4-8.1.000-files/tests-numer-EXM104_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM104-FHIR4
  
#### FHIR3

* [Measure CQL](fhir3/input/pagecontent/cql/EXM104_FHIR3-8.1.000.cql)
* [Master Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-files/measure-EXM104_FHIR3-8.1.000.json)
* [Terminology Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-files/valuesets-EXM104_FHIR3-8.1.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-files/tests-denom-EXM104_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM104-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM104_FHIR3-8.1.000/EXM104_FHIR3-8.1.000-files/tests-numer-EXM104_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM104-FHIR3


### Discharged on Statin Medication - EXM105

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM105-8.2.000.cql)
* [Master Bundle](fhir401/bundles/EXM105-8.2.000/EXM105-8.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM105-8.2.000/EXM105-8.2.000-files/measure-EXM105-8.2.000.json)
* [Terminology Bundle](fhir401/bundles/EXM105-8.2.000/EXM105-8.2.000-files/valuesets-EXM105-8.2.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM105-8.2.000/EXM105-8.2.000-files/tests-denom-EXM105-bundle.json)
    * Denominator Patient ID: denom-EXM105
* [Numerator Test Bundle](fhir401/bundles/EXM105-8.2.000/EXM105-8.2.000-files/tests-numer-EXM105-bundle.json)
    * Numerator Patient ID: numer-EXM105

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM105_FHIR4-8.1.000.cql)
* [Master Bundle](fhir4/bundles/EXM105_FHIR4-8.1.000/EXM105_FHIR4-8.1.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM105_FHIR4-8.1.000/EXM105_FHIR4-8.1.000-files/measure-EXM105_FHIR4-8.1.000.json)
* [Terminology Bundle](fhir4/bundles/EXM105_FHIR4-8.1.000/EXM105_FHIR4-8.1.000-files/valuesets-EXM105_FHIR4-8.1.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM105_FHIR4-8.1.000/EXM105_FHIR4-8.1.000-files/tests-denom-EXM105_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM105-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM105_FHIR4-8.1.000/EXM105_FHIR4-8.1.000-files/tests-numer-EXM105_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM105-FHIR4

#### FHIR3

* [Measure CQL](fhir3/input/pagecontent/cql/EXM105_FHIR3-8.0.000.cql)
* [Master Bundle](fhir3/bundles/EXM105_FHIR3-8.0.000/EXM105_FHIR3-8.0.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM105_FHIR3-8.0.000/EXM105_FHIR3-8.0.000-files/measure-EXM105_FHIR3-8.0.000.json)
* [Terminology Bundle](fhir3/bundles/EXM105_FHIR3-8.0.000/EXM105_FHIR3-8.0.000-files/valuesets-EXM105_FHIR3-8.0.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM105_FHIR3-8.0.000/EXM105_FHIR3-8.0.000-files/tests-denom-EXM105_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM105-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM105_FHIR3-8.0.000/EXM105_FHIR3-8.0.000-files/tests-numer-EXM105_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM105-FHIR3


### Venous Thromboembolism Prophylaxis - EXM108

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM108-8.3.000.cql)
* [Master Bundle](fhir401/bundles/EXM108-8.3.000/EXM108-8.3.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM108-8.3.000/EXM108-8.3.000-files/measure-EXM108-8.3.000.json)
* [Terminology Bundle](fhir401/bundles/EXM108-8.3.000/EXM108-8.3.000-files/valuesets-EXM108-8.3.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM108-8.3.000/EXM108-8.3.000-files/tests-denom-EXM108-bundle.json)
    * Denominator Patient ID: denom-EXM108
* [Numerator Test Bundle](fhir401/bundles/EXM108-8.3.000/EXM108-8.3.000-files/tests-numer-EXM108-bundle.json)
    * Numerator Patient ID: numer-EXM108

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM108_FHIR4-8.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-files/measure-EXM108_FHIR4-8.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-files/valuesets-EXM108_FHIR4-8.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-files/tests-denom-EXM108_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM108-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM108_FHIR4-8.2.000/EXM108_FHIR4-8.2.000-files/tests-numer-EXM108_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM108-FHIR4

#### FHIR3

* [Measure CQL](fhir3/input/pagecontent/cql/EXM108_FHIR3-7.4.000.cql)
* [Master Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-files/measure-EXM108_FHIR3-7.4.000.json)
* [Terminology Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-files/valuesets-EXM108_FHIR3-7.4.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-files/tests-denom-EXM108_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM108-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM108_FHIR3-7.4.000/EXM108_FHIR3-7.4.000-files/tests-numer-EXM108_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM108-FHIR3

### Median Admit Decision Time to ED Departure Time for Admitted Patients - EXM111

### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM111-9.1.000.cql)
* [Master Bundle](fhir401/bundles/EXM111-9.1.000/EXM111-9.1.000-bundle.json)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM111-9.1.000/EXM111-9.1.000-files/measure-EXM111-9.1.000.json)
* [Terminology Bundle](fhir401/bundles/EXM111-9.1.000/EXM111-9.1.000-files/valuesets-EXM111-9.1.000-bundle.json)
* [Stratification 1 Test Bundle](fhir401/bundles/EXM111-9.1.000/EXM111-9.1.000-files/tests-measure-strat1-EXM111-bundle.json)
    * Stratification 1 Patient ID: measure-strat1-EXM111
* [Stratification 1 Exclusion Test Bundle](fhir401/bundles/EXM111-9.1.000/EXM111-9.1.000-files/tests-measure-strat1-excl-EXM111-bundle.json)
    * Stratification 1 Exclusion Patient ID: measure-strat1-excl-EXM111
* [Stratification 2 Test Bundle](fhir401/bundles/EXM111-9.1.000/EXM111-9.1.000-files/tests-measure-strat2-EXM111-bundle.json)
    * Stratification 2 Patient ID: measure-strat2-EXM111
* [Stratification 2 Exclusion Test Bundle](fhir401/bundles/EXM111-9.1.000/EXM111-9.1.000-files/tests-measure-strat2-excl-EXM111-bundle.json)
    * Stratification 2 Exclusion Patient ID: measure-strat2-excl-EXM111


### Cervical Cancer Screening - EXM124

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM124-9.0.000.cql)
* [Master Bundle](fhir401/bundles/EXM124-9.0.000/EXM124-9.0.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM124-9.0.000/EXM124-9.0.000-files/measure-EXM124-9.0.000.json)
* [Terminology Bundle](fhir401/bundles/EXM124-9.0.000/EXM124-9.0.000-files/valuesets-EXM124-9.0.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM124-9.0.000/EXM124-9.0.000-files/tests-denom-EXM124-bundle.json)
    * Denominator Patient ID: denom-EXM124-FHI4
* [Numerator Test Bundle](fhir401/bundles/EXM124-9.0.000/EXM124-9.0.000-files/tests-numer-EXM124-bundle.json)
    * Numerator Patient ID: numer-EXM124

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM124_FHIR4-8.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/measure-EXM124_FHIR4-8.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/valuesets-EXM124_FHIR4-8.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/tests-denom-EXM124_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM124-FHI4
* [Numerator Test Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/tests-numer-EXM124_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM124-FHIR4

#### FHIR3

* [Measure CQL](fhir3/input/pagecontent/cql/EXM124_FHIR3-7.2.000.cql)
* [Master Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-files/measure-EXM124_FHIR3-7.2.000.json)
* [Terminology Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-files/valuesets-EXM124_FHIR3-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-files/tests-denom-EXM124_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM124-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM124_FHIR3-7.2.000/EXM124_FHIR3-7.2.000-files/tests-numer-EXM124_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM124-FHIR3


### Breast Cancer Screening - EXM125

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM125-7.3.000.cql)
* [Master Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-files/measure-EXM125-7.3.000.json)
* [Terminology Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-files/valuesets-EXM125-7.3.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-files/tests-denom-EXM125-bundle.json)
    * Denominator Patient ID: denom-EXM125
* [Numerator Test Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-files/tests-numer-EXM125-bundle.json)
    * Numerator Patient ID: numer-EXM125

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM125_FHIR4-7.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/measure-EXM125_FHIR4-7.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/valuesets-EXM125_FHIR4-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/tests-denom-EXM125_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM125-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/tests-numer-EXM125_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM125-FHIR4

#### FHIR3

* [Measure CQL](fhir3/input/pagecontent/cql/EXM125_FHIR3-7.2.000.cql)
* [Master Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-files/measure-EXM125_FHIR3-7.2.000.json)
* [Terminology Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-files/valuesets-EXM125_FHIR3-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-files/tests-denom-EXM125_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM125-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM125_FHIR3-7.2.000/EXM125_FHIR3-7.2.000-files/tests-numer-EXM125_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM125-FHIR3


### Colorectal Cancer Screening - EXM130

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM130-7.3.000.cql)
* [Master Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-files/measure-EXM130-8.0.000.json)
* [Terminology Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-files/valuesets-EXM130-8.0.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-files/tests-denom-EXM130-bundle.json)
    * Denominator Patient ID: denom-EXM130
* [Numerator Test Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-files/tests-numer-EXM130-bundle.json)
    * Numerator Patient ID: numer-EXM130

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM130_FHIR4-7.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/measure-EXM130_FHIR4-7.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/valuesets-EXM130_FHIR4-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/tests-denom-EXM130_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM130-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/tests-numer-EXM130_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM130-FHIR4

#### FHIR3

* [Measure CQL](fhir3/input/pagecontent/cql/EXM130_FHIR3-7.2.000.cql)
* [Master Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-files/measure-EXM130_FHIR3-7.2.000.json)
* [Terminology Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-files/valuesets-EXM130_FHIR3-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-files/tests-denom-EXM130_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM130-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM130_FHIR3-7.2.000/EXM130_FHIR3-7.2.000-files/tests-numer-EXM130_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM130-FHIR3


### Dementia: Cognitive Assessment - EXM149

### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM149-9.2.000.cql)
* [Master Bundle](fhir401/bundles/EXM149-9.2.000/EXM149-9.2.000-bundle.json)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM149-9.2.000/EXM149-9.2.000-files/measure-EXM149-9.2.000.json)
* [Terminology Bundle](fhir401/bundles/EXM149-9.2.000/EXM149-9.2.000-files/valuesets-EXM149-9.2.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM149-9.2.000/EXM149-9.2.000-files/tests-denom-EXM149-bundle.json)
    * Denominator Patient ID: denom-EXM149
* [Numerator Test Bundle](fhir401/bundles/EXM149-9.2.000/EXM149-9.2.000-files/tests-numer-EXM149-bundle.json)
    * Numerator Patient ID: numer-EXM149
* [Denominator Exclusion Test Bundle](fhir401/bundles/EXM149-9.2.000/EXM149-9.2.000-files/tests-denex-EXM149-bundle.json)
    * Denominator Exclusion Patient ID: denex-EXM149

### Chlamydia Screening for Women - EXM153

### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM153-9.2.000.cql)
* [Master Bundle](fhir401/bundles/EXM153-9.2.000/EXM153-9.2.000-bundle.json)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM153-9.2.000/EXM153-9.2.000-files/measure-EXM153-9.2.000.json)
* [Terminology Bundle](fhir401/bundles/EXM153-9.2.000/EXM153-9.2.000-files/valuesets-EXM153-9.2.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM153-9.2.000/EXM153-9.2.000-files/tests-denom-EXM153-bundle.json)
    * Denominator Patient ID: denom-EXM153
* [Numerator Stratification 1 Test Bundle](fhir401/bundles/EXM153-9.2.000/EXM153-9.2.000-files/tests-numer-strat1-EXM153-bundle.json)
    * Numerator Stratification 1 Patient ID: numer-strat1-EXM153
* [Numerator Stratification 2 Test Bundle](fhir401/bundles/EXM153-9.2.000/EXM153-9.2.000-files/tests-numer-strat2-EXM153-bundle.json)
    * Numerator Stratification 2 Patient ID: numer-strat2-EXM153
* [Denominator Exclusion Test Bundle](fhir401/bundles/EXM153-9.2.000/EXM153-9.2.000-files/tests-denomexcl-EXM153-bundle.json)
    * Denominator Exclusion Patient ID: denomexcl-EXM153

### Controlling Blood Pressure - EXM165

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM165_FHIR4-8.5.000.cql)
* [Master Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-files/measure-EXM165_FHIR4-8.5.000.json)
* [Terminology Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-files/valuesets-EXM165_FHIR4-8.5.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-files/tests-denom-EXM165_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM165-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM165_FHIR4-8.5.000/EXM165_FHIR4-8.5.000-files/tests-numer-EXM165_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM165-FHIR4

#### FHIR3

* [Measure CQL](fhir3/input/pagecontent/cql/EXM165_FHIR3-8.5.000.cql)
* [Master Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-files/measure-EXM165_FHIR3-8.5.000.json)
* [Terminology Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-files/valuesets-EXM165_FHIR3-8.5.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-files/tests-denom-EXM165_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM165-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM165_FHIR3-8.5.000/EXM165_FHIR3-8.5.000-files/tests-numer-EXM165_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM165-FHIR3


### HIV Screening - EXM349

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM349-2.1.000.cql)
* [Master Bundle](fhir401/bundles/EXM349-2.1.000/EXM349-2.1.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM349-2.1.000/EXM349-2.1.000-files/measure-EXM349-2.1.000.json)
* [Terminology Bundle](fhir401/bundles/EXM349-2.1.000/EXM349-2.1.000-files/valuesets-EXM349-2.1.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM349-2.1.000/EXM349-2.1.000-files/tests-denom-EXM349-bundle.json)
    * Denominator Patient ID: denom-EXM349
* [Numerator Test Bundle](fhir401/bundles/EXM349-2.1.000/EXM349-2.1.000-files/tests-numer-EXM349-bundle.json)
    * Numerator Patient ID: numer-EXM349

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM349_FHIR4-2.9.000.cql)
* [Master Bundle](fhir4/bundles/EXM349_FHIR4-2.9.000/EXM349_FHIR4-2.9.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM349_FHIR4-2.9.000/EXM349_FHIR4-2.9.000-files/measure-EXM349_FHIR4-2.9.000.json)
* [Terminology Bundle](fhir4/bundles/EXM349_FHIR4-2.9.000/EXM349_FHIR4-2.9.000-files/valuesets-EXM349_FHIR4-2.9.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM349_FHIR4-2.9.000/EXM349_FHIR4-2.9.000-files/tests-denom-EXM349_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM349-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM349_FHIR4-2.9.000/EXM349_FHIR4-2.9.000-files/tests-numer-EXM349_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM349-FHIR4

#### FHIR3

* [Measure CQL](fhir3/input/pagecontent/cql/EXM349_FHIR3-2.9.000.cql)
* [Master Bundle](fhir3/bundles/EXM349_FHIR3-2.9.000/EXM349_FHIR3-2.9.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM349_FHIR3-2.9.000/EXM349_FHIR3-2.9.000-files/measure-EXM349_FHIR3-2.9.000.json)
* [Terminology Bundle](fhir3/bundles/EXM349_FHIR3-2.9.000/EXM349_FHIR3-2.9.000-files/valuesets-EXM349_FHIR3-2.9.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM349_FHIR3-2.9.000/EXM349_FHIR3-2.9.000-files/tests-denom-EXM349_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM349-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM349_FHIR3-2.9.000/EXM349_FHIR3-2.9.000-files/tests-numer-EXM349_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM349-FHIR3


### Safe Use of Opioids - Concurrent Prescribing - EXM506

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM506-2.2.000.cql)
* [Master Bundle](fhir401/bundles/EXM506-2.2.000/EXM506-2.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM506-2.2.000/EXM506-2.2.000-files/measure-EXM506-3.0.000.json)
* [Terminology Bundle](fhir401/bundles/EXM506-2.2.000/EXM506-2.2.000-files/valuesets-EXM506-2.2.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM506-2.2.000/EXM506-2.2.000-files/tests-denom-EXM506-bundle.json)
    * Denominator Patient ID: denom-EXM506
* [Numerator Test Bundle](fhir401/bundles/EXM506-2.2.000/EXM506-2.2.000-files/tests-numer-EXM506-bundle.json)
    * Numerator Patient ID: numer-EXM506

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM506_FHIR4-2.0.000.cql)
* [Master Bundle](fhir4/bundles/EXM506_FHIR4-2.0.000/EXM506_FHIR4-2.0.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM506_FHIR4-2.0.000/EXM506_FHIR4-2.0.000-files/measure-EXM506_FHIR4-2.0.000.json)
* [Terminology Bundle](fhir4/bundles/EXM506_FHIR4-2.0.000/EXM506_FHIR4-2.0.000-files/valuesets-EXM506_FHIR4-2.0.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM506_FHIR4-2.0.000/EXM506_FHIR4-2.0.000-files/tests-denom-EXM506_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM506-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM506_FHIR4-2.0.000/EXM506_FHIR4-2.0.000-files/tests-numer-EXM506_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM506-FHIR4

#### FHIR3

* [Measure CQL](fhir3/input/pagecontent/cql/EXM506_FHIR3-2.0.000.cql)
* [Master Bundle](fhir3/bundles/EXM506_FHIR3-2.0.000/EXM506_FHIR3-2.0.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir3/bundles/EXM506_FHIR3-2.0.000/EXM506_FHIR3-2.0.000-files/measure-EXM506_FHIR3-2.0.000.json)
* [Terminology Bundle](fhir3/bundles/EXM506_FHIR3-2.0.000/EXM506_FHIR3-2.0.000-files/valuesets-EXM506_FHIR3-2.0.000-bundle.json)
* [Denominator Test Bundle](fhir3/bundles/EXM506_FHIR3-2.0.000/EXM506_FHIR3-2.0.000-files/tests-denom-EXM506_FHIR3-bundle.json)
    * Denominator Patient ID: denom-EXM506-FHIR3
* [Numerator Test Bundle](fhir3/bundles/EXM506_FHIR3-2.0.000/EXM506_FHIR3-2.0.000-files/tests-numer-EXM506_FHIR3-bundle.json)
    * Numerator Patient ID: numer-EXM506-FHIR3


### Hospital Core Clinical Data Element - EXM529

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM529-1.0.000.cql)
* [Master Bundle](fhir401/bundles/EXM529-1.0.000/EXM529-1.0.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM529-1.0.000/EXM529-1.0.000-files/measure-EXM529-1.0.000.json)
* [Terminology Bundle](fhir401/bundles/EXM529-1.0.000/EXM529-1.0.000-files/valuesets-EXM529-1.0.000-bundle.json)
* [Initial Population Test Bundle](fhir401/bundles/EXM529-1.0.000/EXM529-1.0.000-files/tests-ip-EXM529-bundle.json)
    * Initial Population Patient ID: ip-EXM529


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
