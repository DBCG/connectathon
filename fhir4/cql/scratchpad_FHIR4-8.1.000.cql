library scratchpad_FHIR4 version '8.1.000'
// for 2020 Reporting Year
//STK 2
/*
Based on CMS104 - Discharged on Antithrombotic Therapy
Author: TJC
*/

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0'

parameter "Measurement Period" Interval<DateTime>
  default Interval[@2019-01-01T00:00:00.0, @2020-01-01T00:00:00.0)

context Patient

define "date":
  @2019-12-17T08:00:00-07:00

define "hardCoded":
  "date" date
  where date during "Measurement Period"
    return date

define "authoredOn":
  [MedicationRequest] DischargeAntithrombotic
    return DischargeAntithrombotic.authoredOn

define "notHardCoded":
  "authoredOn" date
  where date during day of "Measurement Period"
