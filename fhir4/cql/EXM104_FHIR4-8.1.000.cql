// for 2020 Reporting Year
library EXM104_FHIR4 version '8.1.000'
//STK 2
/*
Based on CMS104 - Discharged on Antithrombotic Therapy
Author: TJC
*/

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0'
include MATGlobalCommonFunctions_FHIR4 version '4.0.000' called Global
include SupplementalDataElements_FHIR4 version '1.0.0' called SDE
include TJC_Overall_FHIR4 version '4.0.000' called TJC

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMEDCT": 'http://snomed.info/sct/731000124108'
// NOTE: R4 code system URLs changed to be based on terminology.hl7.org...
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
//codesystem "Diagnosis Role": 'http://hl7.org/fhir/diagnosis-role'
codesystem "RequestIntent": 'http://terminology.hl7.org/CodeSystem/request-intent'
//codesystem "RequestIntent": 'http://hl7.org/fhir/request-intent'
codesystem "MedicationRequestCategory": 'http://terminology.hl7.org/CodeSystem/medicationrequest-category'

//QA
valueset "Antithrombotic Therapy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.201'
valueset "Comfort Measures": 'http://cts.nlm.nih.gov/fhir/ValueSet/1.3.6.1.4.1.33895.1.3.0.45'
valueset "Discharge To Acute Care Facility": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.87'
valueset "Discharged to Health Care Facility for Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.207'
valueset "Discharged to Home for Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.209'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "Hemorrhagic Stroke": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.212'
valueset "Ischemic Stroke": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.247'
valueset "Left Against Medical Advice": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.308'
valueset "Medical Reason": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.473'
valueset "Non-Elective Inpatient Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.424'
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143'
valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'
valueset "Patient Expired": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.309'
valueset "Patient Refusal": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.93'
valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591'
valueset "Race": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.836'
valueset "Ticagrelor Therapy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.39'

code "Birth date": '21112-8' from "LOINC" display 'Birth date'
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

//QA
  define "Encounter with Principal Diagnosis and Age":
    "All Stroke Encounter" AllStrokeEncounter
    	with ["Patient"] BirthDate
    		such that Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(BirthDate.birthDate), start of AllStrokeEncounter.period) >= 18

//QA
        define "All Stroke Encounter":
        	"Non Elective Inpatient Encounter" NonElectiveEncounter
        		where Global.PrincipalDiagnosis(NonElectiveEncounter).code in "Hemorrhagic Stroke"
        		or Global.PrincipalDiagnosis(NonElectiveEncounter).code in "Ischemic Stroke"

//QA
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

//QA - defined in the TJC_Overall_FHIR4, for reading purposes
/*
   define "TJC.Ischemic Stroke Encounters with Discharge Disposition":
     "Ischemic Stroke Encounter" IschemicStrokeEncounter
        where IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Discharge To Acute Care Facility"
          or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Left Against Medical Advice"
          or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Patient Expired"
          or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Discharged to Home for Hospice Care"
          or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Discharged to Health Care Facility for Hospice Care"




//QA
    define "Comfort Measures during Hospitalization":
    	"Ischemic Stroke Encounter" IschemicStrokeEncounter
       	with "Intervention Comfort Measures" ComfortMeasure
        	such that FHIRHelpers.ToDateTime(Coalesce(ComfortMeasure.performed as dateTime,ComfortMeasure.authoredOn)) during Global."HospitalizationWithObservation"(IschemicStrokeEncounter)

//QA
          define "Intervention Comfort Measures":
          	(["ServiceRequest": "Comfort Measures"] P
          		where P.intent in {'order', 'plan'})
          		union
          		(["Procedure": "Comfort Measures"] IntervetionPerformed
          		where IntervetionPerformed.status in {'in progress', 'complete'})
*/

//QA
define "Numerator":
	TJC."Ischemic Stroke Encounter" IschemicStrokeEncounter
		with "Antithrombotic Therapy at Discharge" DischargeAntithrombotic
			such that DischargeAntithrombotic.authoredOn during IschemicStrokeEncounter.period

//QA
      define "Antithrombotic Therapy at Discharge":
      	["MedicationRequest": medication in "Antithrombotic Therapy"] Antithrombotic
      	  where exists (Antithrombotic.category C where FHIRHelpers.ToConcept(C) ~ "Discharge")
      	    and Antithrombotic.intent in {'plan', 'order'}

//QA
define "Denominator Exceptions":
	"Encounter With No Antithrombotic At Discharge"
		union "Encounter With Ticagrelor at Discharge"

//QA
    define "Encounter With No Antithrombotic At Discharge":
    	TJC."Ischemic Stroke Encounter" IschemicStrokeEncounter
    		with "Antithrombotic Not Given at Discharge" NoDischargeAntithrombotic
    			such that NoDischargeAntithrombotic.authoredOn during IschemicStrokeEncounter.period

//QA - removed singleton
          define "Antithrombotic Not Given at Discharge":
          	["MedicationRequest": medication in "Antithrombotic Therapy"] NoAntithromboticDischarge
              where NoAntithromboticDischarge.doNotPerform is true
          			and (NoAntithromboticDischarge.reasonCode in "Medical Reason"
          				or NoAntithromboticDischarge.reasonCode in "Patient Refusal")
                    and exists (NoAntithromboticDischarge.category C where FHIRHelpers.ToConcept(C) ~ "Discharge")

          // NOTE: On the assumption that status of not-taken is the closest to what the measure is looking for, this is the expression:
          // TODO: Request discussion w/ Pharmacy regarding how medications not prescribed at discharged would be documented
          //define "Antithrombotic Not Given at Discharge R4":
          //  ["MedicationStatement": "Antithrombotic Therapy"] AntithromboticTherapy
          //	  where AntithromboticTherapy.status = 'not-taken'
          //		  and (AntithromboticTherapy.statusReason in "Medical Reason"
          //				or AntithrombtoicTherapy.statusReason in "Patient Refusal")

          // If it's documented as a checkbox, it may be represented as an observation
          //define "Antithrombotic Not Given at Discharge (Observation)":
          //  ["Observation": "Medication Not Given At Discharge"] O
          //	  where O.value in "Antithrombotic Therapy"

//QA
    define "Encounter With Ticagrelor at Discharge":
      TJC."Ischemic Stroke Encounter" IschemicStrokeEncounter
        with "Ticagrelor Therapy at Discharge" DischargeTicagrelor
          such that DischargeTicagrelor.authoredOn during IschemicStrokeEncounter.period

          /*define "Encounter With Ticagrelor During Hospitalization":
            TJC."Ischemic Stroke Encounter" IschemicStrokeEncounter
              with ["MedicationAdministration": medication in TJC."Ticagrelor Therapy"] Ticagrelor
                such that Ticagrelor.effective starts during Global."HospitalizationWithObservation"(IschemicStrokeEncounter)*/
          //Looking for Ticagrelor as discharge medication, include a corrected defintion in 2021 CQL based measure

//QA
          define "Ticagrelor Therapy at Discharge":
            ["MedicationRequest": medication in TJC."Ticagrelor Therapy"] Ticagrelor
              where exists (Ticagrelor.category C where FHIRHelpers.ToConcept(C) ~ "Discharge")
                and Ticagrelor.intent in {'order', 'plan'}
