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
* [Measure Bundle](bundles/fhir3/exm165-fhir3-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir3/EXM165/exm165-fhir3-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir3/EXM165/exm165-fhir3-numerator-test-bundle.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM165_FHIR4-8.5.000.cql)
* [Measure Bundle](bundles/fhir4/exm165-fhir4-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir4/EXM165/exm165-fhir4-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir4/EXM165/exm165-fhir4-numerator-test-bundle.json)

### Cervical Cancer Screening - EXM124

#### FHIR3

* [Measure CQL](cql/fhir3/EXM124_FHIR3-7.2.000.cql)
* [Measure Bundle](bundles/fhir3/exm124-fhir3-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir3/EXM124/exm124-fhir3-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir3/EXM124/exm124-fhir3-numerator-test-bundle.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM124_FHIR4-7.2.000.cql)
* [Measure Bundle](bundles/fhir4/exm124-fhir4-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir4/EXM124/exm124-fhir4-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir4/EXM124/exm124-fhir4-numerator-test-bundle.json)

### Breast Cancer Screening - EXM125

#### FHIR3

* [Measure CQL](cql/fhir3/EXM125_FHIR3-7.2.000.cql)
* [Measure Bundle](bundles/fhir3/exm125-fhir3-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir3/EXM125/exm125-fhir3-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir3/EXM125/exm125-fhir3-numerator-test-bundle.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM125_FHIR4-7.2.000.cql)
* [Measure Bundle](bundles/fhir4/exm125-fhir4-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir4/EXM125/exm125-fhir4-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir4/EXM125/exm125-fhir4-numerator-test-bundle.json)

### Colorectal Cancer Screening - EXM130

#### FHIR3

* [Measure CQL](cql/fhir3/EXM130_FHIR3-7.2.000.cql)
* [Measure Bundle](bundles/fhir3/exm130-fhir3-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir3/EXM130/exm130-fhir3-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir3/EXM130/exm130-fhir3-numerator-test-bundle.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM130_FHIR4-7.2.000.cql)
* [Measure Bundle](bundles/fhir4/exm130-fhir4-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir4/EXM130/exm130-fhir4-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir4/EXM130/exm130-fhir4-numerator-test-bundle.json)

### Venous Thromboembolism Prophylaxis - EXM108

#### FHIR3

* [Measure CQL](cql/fhir3/EXM108_FHIR3-7.4.000.cql)
* [Measure Bundle](bundles/fhir3/exm108-fhir3-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir3/EXM108/exm108-fhir3-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir3/EXM108/exm108-fhir3-numerator-test-bundle.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM108_FHIR4-7.4.000.cql)
* [Measure Bundle](bundles/fhir4/exm108-fhir4-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir4/EXM108/exm108-fhir4-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir4/EXM108/exm108-fhir4-numerator-test-bundle.json)

### Discharged on Antithrombotic Therapy - EXM104

#### FHIR3

* [Measure CQL](cql/fhir3/EXM104_FHIR3-8.1.000.cql)
* [Measure Bundle](bundles/fhir3/exm104-fhir3-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir3/EXM104/exm104-fhir3-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir3/EXM104/exm72-fhir3-numerator-test-bundle.json)

#### FHIR4

* [Measure CQL](cql/fhir4/EXM104_FHIR4-8.1.000.cql)
* [Measure Bundle](bundles/fhir4/exm72-fhir4-bundle.json)
* [Denominator Patient (ID: XXXX)](tests/fhir4/EXM104/exm72-fhir4-denominator-test-bundle.json)
* [Numerator Patient (ID: XXXX)](tests/fhir4/EXM104/exm72-fhir4-numerator-test-bundle.json)

## CDC Opioid Prescribing Support Guideline

### Recommendation 10

#### FHIR3

* [Recommendation CQL](cql/fhir3/OpioidCDS_R10_FHIR3-0.1.0.cql)
* [Recommendation Bundle](bundles/fhir3/opioidcds-r10-fhir3-bundle.json)
* [No Recommendation (ID: XXXX)](tests/fhir3/OpioidCDSR10/opioidcds-r10-fhir3-out-test-bundle.json)
* [Recommendation (ID: XXXX)](tests/fhir3/OpioidCDSR10/opioidcds-r10-fhir3-in-test-bundle.json)

#### FHIR4

* [Recommendation CQL](cql/fhir4/OpioidCDS_R10_FHIR4-0.1.0.cql)
* [Recommendation Bundle](bundles/fhir4/opioidcds-r10-fhir4-bundle.json)
* [No Recommendation (ID: XXXX)](tests/fhir4/OpioidCDSR10/opioidcds-r10-fhir4-out-test-bundle.json)
* [Recommendation (ID: XXXX)](tests/fhir4/OpioidCDSR10/opioidcds-r10-fhir4-in-test-bundle.json)

### Recommendation 11

#### FHIR3

* [Recommendation CQL](cql/fhir3/OpioidCDS_R11_FHIR3-0.1.0.cql)
* [Recommendation Bundle](bundles/fhir3/opioidcds-r11-fhir3-bundle.json)
* [No Recommendation (ID: XXXX)](tests/fhir3/OpioidCDSR11/opioidcds-r11-fhir3-out-test-bundle.json)
* [Recommendation (ID: XXXX)](tests/fhir3/OpioidCDSR11/opioidcds-r11-fhir3-in-test-bundle.json)

#### FHIR4

* [Recommendation CQL](cql/fhir4/OpioidCDS_R11_FHIR4-0.1.0.cql)
* [Recommendation Bundle](bundles/fhir4/opioidcds-r11-fhir4-bundle.json)
* [No Recommendation (ID: XXXX)](tests/fhir4/OpioidCDSR11/opioidcds-r11-fhir4-out-test-bundle.json)
* [Recommendation (ID: XXXX)](tests/fhir4/OpioidCDSR11/opioidcds-r11-fhir4-in-test-bundle.json)

