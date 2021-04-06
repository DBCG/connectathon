library TJCOverall_FHIR3 version '1.4.000'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include MATGlobalCommonFunctions_FHIR3 version '2.0.000' called Global
include SupplementalDataElements_FHIR3 version '1.0.0' called SDE

// TODO: Use FHIR terminology URLs here
codesystem "LOINC:2.46": 'urn:oid:2.16.840.1.113883.6.1' version 'urn:hl7:version:2.46'
codesystem "SNOMEDCT:2016-03": 'urn:oid:2.16.840.1.113883.6.96' version 'urn:hl7:version:2016-03'

//codesystem "LOINC:2.46": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.6.1' version 'urn:hl7:version:2.46'
//codesystem "SNOMEDCT:2016-03": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.6.96' version 'urn:hl7:version:2016-03'

// TODO: Use NLM VSAC Canonical URLs
/*
valueset "Encounter Inpatient": 'urn:oid:2.16.840.1.113883.3.666.5.307'
valueset "Non-Elective Inpatient Encounter": 'urn:oid:2.16.840.1.113883.3.117.1.7.1.424'
valueset "Ischemic Stroke": 'urn:oid:2.16.840.1.113883.3.117.1.7.1.247'
valueset "Hemorrhagic Stroke": 'urn:oid:2.16.840.1.113883.3.117.1.7.1.212'
valueset "Comfort Measures": 'urn:oid:1.3.6.1.4.1.33895.1.3.0.45'
valueset "Emergency Department Visit": 'urn:oid:2.16.840.1.113883.3.117.1.7.1.292'
valueset "Left Against Medical Advice": 'urn:oid:2.16.840.1.113883.3.117.1.7.1.308'
valueset "Discharged to Health Care Facility for Hospice Care": 'urn:oid:2.16.840.1.113883.3.117.1.7.1.207'
valueset "Patient Expired": 'urn:oid:2.16.840.1.113883.3.117.1.7.1.309'
valueset "Discharge To Acute Care Facility": 'urn:oid:2.16.840.1.113883.3.117.1.7.1.87'
valueset "Discharged to Home for Hospice Care": 'urn:oid:2.16.840.1.113883.3.117.1.7.1.209'
*/

valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Non-Elective Inpatient Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.4.1.424'
valueset "Ischemic Stroke": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.247'
valueset "Hemorrhagic Stroke": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.212'
valueset "Comfort Measures": 'http://cts.nlm.nih.gov/fhir/ValueSet/1.3.6.1.4.1.33895.1.3.0.45'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Left Against Medical Advice": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.308'
valueset "Discharged to Health Care Facility for Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.207'
valueset "Patient Expired": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.309'
valueset "Discharge To Acute Care Facility": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.87'
valueset "Discharged to Home for Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.209'


code "Birthdate": '21112-8' from "LOINC:2.46" display 'Birth date'
code "Dead": '419099009' from "SNOMEDCT:2016-03" display 'Dead'

parameter "Measurement Period" Interval<DateTime>

context Patient

// refence VTE for order and Procedure
define "Intervention Comfort Measures":
//	(["ProcedureRequest": "Comfort Measures"] P
//		where P.intent = 'order')
//		union
		(["Procedure": "Comfort Measures"] InterventionPerformed
		where InterventionPerformed.status = 'completed')

define "All Stroke Encounter":
	"Non Elective Inpatient Encounter" NonElectiveEncounter
    where Global.PrincipalDiagnosis(NonElectiveEncounter).code in "Hemorrhagic Stroke"
      or Global.PrincipalDiagnosis(NonElectiveEncounter).code in "Ischemic Stroke"

/*
//Add QI-Core invariant to require there must be a billing and rank must be unique and required within diagnosis list Moved to global common library
define function "PrincipalDiagnosis"(Encounter Encounter):
  (singleton from (Encounter.diagnosis D where D.role = 'billing' and D.rank = 1)) PD
    return singleton from ([Condition: id in GetId(PD.condition.reference)])

define function "PrincipalDiagnosis" (Encounter Encounter):
	(singleton from (Principal.diagnosis D where D.role = 'billing' and D.rank = 1)) PD
		return singleton from ([Condition: id in GetId(PD.condition.reference)])

define function GetId(uri String):
  Last(Split(uri, '/'))
*/

define "Ischemic Stroke Encounter":
	"Encounter with Principal Diagnosis and Age" EncounterWithAge
		where Global.PrincipalDiagnosis(EncounterWithAge).code in "Ischemic Stroke"

define "Ischemic Stroke Encounters with Discharge Status":
	( ( "Ischemic Stroke Encounter" IschemicStrokeEncounter
				where IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Discharge To Acute Care Facility"
					or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Left Against Medical Advice"
					or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Patient Expired"
					or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Discharged to Home for Hospice Care"
					or IschemicStrokeEncounter.hospitalization.dischargeDisposition in "Discharged to Health Care Facility for Hospice Care"
		)
	)

//New function in global library
define function "Hospitalization"(Encounter "Encounter"):
	( singleton from ( ["Encounter": "Emergency Department Visit"] EDVisit
			where EDVisit.period ends 1 hour or less on or before start of FHIRHelpers.ToInterval(Encounter.period)
	) ) X
		return if X is null then Encounter.period else Interval[start of FHIRHelpers.ToInterval(X.period), end of FHIRHelpers.ToInterval(Encounter.period)]

define "Comfort Measures during Hospitalization":
	"Ischemic Stroke Encounter" IschemicStrokeEncounter
		with "Intervention Comfort Measures" ComfortMeasure
			//such that Coalesce(start of ComfortMeasure.performedPeriod, ComfortMeasure.authorDatetime)during Global."Hospitalization"(IschemicStrokeEncounter) //authorDatetime maps to FHIR.provenance.recorded, which I don't know how to do
			such that start of FHIRHelpers.ToInterval(ComfortMeasure.performed)/*Period*/ during "Hospitalization"(IschemicStrokeEncounter)

define function "CalendarAgeInYearsAt"(BirthDate date, AsOf DateTime):
	years between BirthDate and ToDate(AsOf)

define "Encounter with Principal Diagnosis and Age":
	"All Stroke Encounter" AllStrokeEncounter
		with ["Patient"] BirthDate
			such that "CalendarAgeInYearsAt"(BirthDate.birthDate, start of FHIRHelpers."ToInterval"(AllStrokeEncounter.period))>= 18

define function "LengthInDays"(Value Interval<DateTime>):
	difference in days between start of Value and end of Value

define "Non Elective Inpatient Encounter":
	["Encounter": "Non-Elective Inpatient Encounter"] NonElectiveEncounter
		where "LengthInDays"(NonElectiveEncounter.period)<= 120
			and NonElectiveEncounter.period ends during "Measurement Period"
