library EXM105_FHIR4 version '8.1.000'
// for 2020 Reporting Year
// NOTE: BTR 2019-07-30: Renamed for consistency
//library "Discharged on Statin Medication" version '8.1.0'
//STK 6

/*
Based on CMS105v8 - Discharged on Statin Medication
Author: TJC
*/

using FHIR version '4.0.0'

// NOTE: BTR 2019-07-30: Updated dependencies
include FHIRHelpers version '4.0.0'
include MATGlobalCommonFunctions_FHIR4 version '4.0.000' called Global
include SupplementalDataElements_FHIR4 version '1.0.0' called SDE
include TJC_Overall_FHIR4 version '4.0.000' called TJC

//QA
codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMEDCT": 'http://snomed.info/sct/731000124108'
// NOTE: R4 code system URLs changed to be based on terminology.hl7.org...
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
//codesystem "Diagnosis Role": 'http://hl7.org/fhir/diagnosis-role'
codesystem "RequestIntent": 'http://terminology.hl7.org/CodeSystem/request-intent'
//codesystem "RequestIntent": 'http://hl7.org/fhir/request-intent'
codesystem "MedicationRequestCategory": 'http://terminology.hl7.org/CodeSystem/medicationrequest-category'

//QA
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

//QA
// TODO: Use NLM VSAC Canonical URLs
code "Birthdate": '21112-8' from "LOINC" display 'Birth date'
code "Dead": '419099009' from "SNOMEDCT" display 'Dead'
//code "Medication-dischargeMedication": '8654-6' from "LOINC" display 'Hospital Discharge medications'
code "Billing": 'billing' from "Diagnosis Role" display 'Billing'
code "Order": 'order' from "RequestIntent" display 'Order'
code "Discharge": 'discharge' from "MedicationRequestCategory" display 'Discharge'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
	SDE."SDE Payer"

define "SDE Race":
  SDE."SDE Race"

define "SDE Sex":
	SDE."SDE Sex"

//QA
define "Initial Population":
	TJC."Encounter with Principal Diagnosis and Age"


    define "Encounter with Principal Diagnosis and Age":
      "All Stroke Encounter" AllStrokeEncounter
      	with ["Patient"] BirthDate
      		such that Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(BirthDate.birthDate), start of AllStrokeEncounter.period) >= 18

          define "All Stroke Encounter":
          	"Non Elective Inpatient Encounter" NonElectiveEncounter
          		where Global.PrincipalDiagnosis(NonElectiveEncounter).code in "Hemorrhagic Stroke"
          		or Global.PrincipalDiagnosis(NonElectiveEncounter).code in "Ischemic Stroke"

                define "Non Elective Inpatient Encounter":
                	["Encounter": "Non-Elective Inpatient Encounter"] NonElectiveEncounter
                		where Global."LengthInDays"(NonElectiveEncounter.period)<= 120
                			and NonElectiveEncounter.period ends during "Measurement Period"

//QA
define "Denominator":
	TJC."Ischemic Stroke Encounter"

//QA
  define "Ischemic Stroke Encounter":
    "Encounter with Principal Diagnosis and Age" EncounterWithAge
      where Global.PrincipalDiagnosis(EncounterWithAge).code in "Ischemic Stroke"

//QA
define "Denominator Exclusions":
	TJC."Ischemic Stroke Encounters with Discharge Disposition"
		union TJC."Comfort Measures during Hospitalization"

//QA
    define "TJC.Ischemic Stroke Encounters with Discharge Disposition":
    ( ( "Ischemic Stroke Encounter" IschemicStrokeEncounter
        where IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Discharge To Acute Care Facility"
          or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Left Against Medical Advice"
          or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Patient Expired"
          or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Discharged to Home for Hospice Care"
          or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Discharged to Health Care Facility for Hospice Care"
          )
    )

//QA - edited Global."Hospitalization" to Global."HospitalizationWithObservation"
    define "Comfort Measures during Hospitalization":
    	"Ischemic Stroke Encounter" IschemicStrokeEncounter
       	with "Intervention Comfort Measures" ComfortMeasure
        	such that Coalesce(ComfortMeasure.performed as dateTime,ComfortMeasure.authoredOn) during Global."HospitalizationWithObservation"(IschemicStrokeEncounter)

//QA
          define "Intervention Comfort Measures":
          	(["ServiceRequest": "Comfort Measures"] P
          		where P.intent in {'order', 'plan'})
          		union
          		(["Procedure": "Comfort Measures"] IntervetionPerformed
          		where IntervetionPerformed.status in {'in progress', 'complete'})

//QA
define "Numerator":
	"Ischemic Stroke Encounter" IschemicStrokeEncounter
		with "Statin at Discharge" DischargeStatin
			such that DischargeStatin.authoredOn during (IschemicStrokeEncounter.period)

//QA
      define "Statin at Discharge":
        ["MedicationRequest": medication in "Statin Grouper"] Statin
          where exists (Statin.category C where FHIRHelpers.ToConcept(C) ~ "Discharge")
            and Statin.intent in {'order', 'plan'}

//QA - added "starts" prior to "on or before end of, was missing. Should "Normalize Onset" be in quotes if it is a function?
define "Denominator Exception":
	("Ischemic Stroke Encounter" IschemicStrokeEncounter
		with "Statin Not Given at Discharge" NoDischargeStatin
			such that NoDischargeStatin.authoredOn during IschemicStrokeEncounter.period
	)
	union
	("Ischemic Stroke Encounter" IschemicStrokeEncounter
		with "Statin Allergy" StatinAllergy
			such that "Normalize Onset"(StatinAllergy.onset) starts on or before end of IschemicStrokeEncounter.period)
  union "Encounter with Max LDL less than 70 mg per dL"

//QA - added and NoStatin.intent = 'order'
      define "Statin Not Given at Discharge":
        ["MedicationRequest": medication in "Statin Grouper"] NoStatin
          where FHIRHelpers.ToBoolean(NoStatin.doNotPerform) is true
          and (NoStatin.reasonCode in "Medical Reason"
            or NoStatin.reasonCode in "Patient Refusal")
             and exists (NoStatin.category C where FHIRHelpers.ToConcept(C) ~ "Discharge")
              and NoStatin.intent = 'order'

//QA
      define "Statin Allergy":
      	["AllergyIntolerance": "Statin Allergen"]

//QA - was missing 'mg/dL' after < 70
      define "Encounter with Max LDL less than 70 mg per dL":
      	"Ischemic Stroke Encounter" IschemicStrokeEncounter
      		where Max(["Observation": "LDL-c"] Ldl
      				where (Ldl.issued) during Interval[(IschemicStrokeEncounter.period.start) - 30 days, IschemicStrokeEncounter.period.end]
      				return (Ldl.value as Quantity)
      		) < 70 'mg/dL'

//Following function copied from MATGlobalCommonFunctions 2.0 in cqf-measures github repo
define function "Normalize Onset"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
	if onset is FHIR.dateTime then Interval[onset.value, onset.value]
	 else if onset is FHIR.Period then FHIRHelpers.ToInterval(onset as FHIR.Period)
  	else null
