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

context Patient

define "Medication Administration":
  ["MedicationAdministration"]

define "Procedure":
  [Procedure]

define "Choice Procedure Medication Administration":
  "Procedure"
    union "Medication Administration"

define "Numerator":
  "Choice Procedure Medication Administration" choiceProcMed
    where Coalesce(choiceProcMed.effective as Period, choiceProcMed.performed as Period) != null

define "Initial Population":
  "Medication Administration"

define "Denominator":
  "Initial Population"

define "Denominator Exclusion":
  [Observation]
