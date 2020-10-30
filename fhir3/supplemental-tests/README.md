# MITRE Test Patient Bundles

This directory includes various FHIR STU3 Bundles, generated with [Synthea](https://github.com/projecttacoma/synthea/) for various FHIR Measures. All of the modules used to generate this data can be viewed in our [Synthea repository](https://github.com/projecttacoma/synthea/tree/abacus/src/main/resources/modules), and the verification of the populations was done with our [fhir-bundle-calculator utility](https://github.com/projecttacoma/fhir-bundle-calculator/).

Synthea modules that were built specifically for the measures will have the measure name in them(e.g. https://github.com/projecttacoma/synthea/blob/abacus/src/main/resources/modules/EXM130-8.0.000-r4.json). You can view them graphically by going to https://synthetichealth.github.io/module-builder/ and pasting the desired module JSON in.

## Currently Supported Measures

* [EXM104_FHIR3-8.1.000](https://github.com/DBCG/connectathon/tree/master/fhir3/bundles/EXM104_FHIR3-8.1.000)
  * [10 Numerator Patients](https://github.com/DBCG/connectathon/tree/master/fhir3/supplemental-tests/EXM104/numerator)
  * [10 Denominator Patients](https://github.com/DBCG/connectathon/tree/master/fhir3/supplemental-tests/EXM104/denominator)
* [EXM124_FHIR3-7.2.000](https://github.com/DBCG/connectathon/tree/master/fhir3/bundles/EXM124_FHIR3-7.2.000)
  * [10 Numerator Patients](https://github.com/DBCG/connectathon/tree/master/fhir3/supplemental-tests/EXM124/numerator)
  * [10 Denominator Patients](https://github.com/DBCG/connectathon/tree/master/fhir3/supplemental-tests/EXM124/denominator)
* [EXM125_FHIR3-7.2.000](https://github.com/DBCG/connectathon/tree/master/fhir3/bundles/EXM125_FHIR3-7.2.000)
  * [10 Numerator Patients](https://github.com/DBCG/connectathon/tree/master/fhir3/supplemental-tests/EXM125/numerator)
  * [10 Denominator Patients](https://github.com/DBCG/connectathon/tree/master/fhir3/supplemental-tests/EXM125/denominator)
* [EXM130_FHIR3-7.2.000](https://github.com/DBCG/connectathon/tree/master/fhir3/bundles/EXM130_FHIR3-7.2.000)
  * [10 Numerator Patients](https://github.com/DBCG/connectathon/tree/master/fhir3/supplemental-tests/EXM130/numerator)
  * [10 Denominator Patients](https://github.com/DBCG/connectathon/tree/master/fhir3/supplemental-tests/EXM130/denominator)

## Uploading to a Server

Included here is a utility (`upload-bundles.sh`) for uploading all Patient Bundles for a given Measure to a FHIR server.

1. Replace `BASE_URL` in `upload-bundles.sh` with the url for your FHIR server (default is http://localhost:8080/cqf-ruler-dstu3/fhir)
2. In a terminal, run `./upload-bundles.sh <directory>` and replace `<directory>` with one of the supported measures. E.g. for EXM104, you would run `./upload-bundles.sh EXM104`

## Questions?

Contact Matthew Gramigna (mgramigna@mitre.org)
