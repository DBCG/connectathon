library EXM105_FHIR4 version '8.1.000'

/*
Based on CMS105v8 - Discharged on Statin Medication
Author: TJC
*/

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0'

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMEDCT": 'http://snomed.info/sct/731000124108'
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "RequestIntent": 'http://terminology.hl7.org/CodeSystem/request-intent'
codesystem "MedicationRequestCategory": 'http://terminology.hl7.org/CodeSystem/medicationrequest-category'

valueset "Comfort Measures": 'http://cts.nlm.nih.gov/fhir/ValueSet/1.3.6.1.4.1.33895.1.3.0.45'
valueset "Discharged to Health Care Facility for Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.207'
valueset "Discharge To Acute Care Facility": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.87'
valueset "Discharged to Home for Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.209'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "Ischemic Stroke": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.247'
valueset "Hemorrhagic Stroke": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.212'
valueset "LDL-c": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.215'
valueset "Left Against Medical Advice": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.308'
valueset "Medical Reason": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.473'
valueset "Non-Elective Inpatient Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.424'
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143'
valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'
valueset "Patient Expired": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.309'
valueset "Patient Refusal": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.93'
valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591'
valueset "Race": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.836'
valueset "Statin Allergen": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.423'
valueset "Statin Grouper": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.19'

code "Birthdate": '21112-8' from "LOINC" display 'Birth date'
code "Dead": '419099009' from "SNOMEDCT" display 'Dead'
code "Billing": 'billing' from "Diagnosis Role" display 'Billing'
code "Order": 'order' from "RequestIntent" display 'Order'
code "Community": 'community' from "MedicationRequestCategory" display 'Community'
code "Discharge": 'discharge' from "MedicationRequestCategory" display 'Discharge'

parameter "Measurement Period" Interval<DateTime>
  default Interval[@2019-01-01T00:00:00.0, @2020-01-01T00:00:00.0)

context Patient

define "Medication Request Intent is an Enumeration":
  [MedicationRequest] MR
    return MR.intent

//This is what causes the error
/* define "intent equals code":
[MedicationRequest] MR
  return MR.intent = 'order'

define "intent in list of codes":
  [MedicationRequest] MR
    return MR.intent in {'order'} */

define "intent value equals code":
  [MedicationRequest] MR
    return MR.intent.value = 'order'

define "intent value in list of codes":
  [MedicationRequest] MR
    return MR.intent.value in {'order'}
