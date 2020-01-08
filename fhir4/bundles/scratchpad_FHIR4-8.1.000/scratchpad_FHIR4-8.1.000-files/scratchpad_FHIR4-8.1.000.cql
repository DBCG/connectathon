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

define "Medication Administration Effective Period":
  ["MedicationAdministration"] MA return MA.effective as Period

define "Encounter":
  [Encounter]

define "From":
  from "Encounter" QualifyingEncounter,
       "Medication Administration Effective Period" EffectivePeriod
       return QualifyingEncounter

define "Initial Population":
  "Encounter"

define "Denominator":
  "Initial Population"

define "Numerator":
  "From"

define "Denominator Exclusion":
  [Observation]
