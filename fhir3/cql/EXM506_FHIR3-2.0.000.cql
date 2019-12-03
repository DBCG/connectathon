library EXM506_FHIR3 version '2.0.000'

using FHIR version '3.0.0'

include MATGlobalCommonFunctions_FHIR3 version '4.0.000' called Global
include FHIRHelpers version '3.0.0' called FHIRHelpers
include SupplementalDataElements_FHIR3 version '1.0.0' called SDE

codesystem "Diagnosis Role": 'http://hl7.org/fhir/diagnosis-role'
codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMEDCT": 'http://snomed.org'
codesystem "RequestIntent": 'http://hl7.org/fhir/request-intent'

valueset "All Primary and Secondary Cancer":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.161'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3157.1004.20'
valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'
valueset "Palliative Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.162'
valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591'
valueset "Race": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.836'
valueset "Schedule II and Schedule III Opioids":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1125.2'
valueset "Schedule IV Benzodiazepines": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1125.1'

code "Birthdate": '21112-8' from "LOINC" display 'Birth date'
code "Order": 'order' from "RequestIntent" display 'Order'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Inpatient Encounter with Age Greater than or Equal to 18":
	["Encounter": "Encounter Inpatient"] EncounterInpatient
		where EncounterInpatient.status = 'finished'
		  and Global."LengthInDays"(EncounterInpatient.period) <= 120
			and EncounterInpatient.period ends during "Measurement Period"
      and Global.CalendarAgeInYearsAt(ToDateTime(Patient.birthDate), start of FHIRHelpers.ToInterval(EncounterInpatient.period)) >= 18


define "Encounter with an Opioid or Benzodiazepine at Discharge":
	"Inpatient Encounter with Age Greater than or Equal to 18" InpatientEncounter
		with [MedicationRequest: medication in "Schedule II and Schedule III Opioids"] OpioidsDischarge
    such that OpioidsDischarge.authoredOn during InpatientEncounter.period
          and OpioidsDischarge.intent = 'order'
				    with [MedicationRequest: medication in "Schedule IV Benzodiazepines"] BenzodiazepineDischarge
    such that BenzodiazepineDischarge.authoredOn during InpatientEncounter.period
           and BenzodiazepineDischarge.intent = 'order'


define "Initial Population":
"Encounter with an Opioid or Benzodiazepine at Discharge"

define "Denominator":
"Initial Population"

 define "Denominator Exclusions":
	("Inpatient Encounter with Age Greater than or Equal to 18" InpatientEncounter
	with [Condition: code in "All Primary and Secondary Cancer"]Cancer
       such that Cancer.clinicalStatus = 'active'
       and Cancer.verificationStatus = 'confirmed'
       and Cancer.onset overlaps InpatientEncounter.period)
		union ("Inpatient Encounter with Age Greater than or Equal to 18" InpatientEncounter
      with (["ProcedureRequest": "Palliative Care"]
			union ["ProcedureRequest": "Hospice Care"] ) PalliativeOrHospiceCareOrder
			such that  PalliativeOrHospiceCareOrder.intent = 'order'
      and PalliativeOrHospiceCareOrder.authoredOn during InpatientEncounter.period)
    union ("Inpatient Encounter with Age Greater than or Equal to 18" InpatientEncounter
  with  (["Procedure": "Palliative Care"]
    	union ["Procedure": "Hospice Care"] ) PalliativeOrHospiceCarePerformed
    					such that PalliativeOrHospiceCarePerformed.performed overlaps InpatientEncounter.period)

define "Encounter with a Concurrent Opioid and Benzodiazepine at Discharge":
	from "Inpatient Encounter with Age Greater than or Equal to 18" InpatientEncounter,
		[MedicationRequest: "Schedule II and Schedule III Opioids"] OpioidsDischarge,
		[MedicationRequest: "Schedule IV Benzodiazepines"] BenzodiazepineDischarge
			where OpioidsDischarge.authoredOn during InpatientEncounter.period
	    	and OpioidsDischarge.intent = 'order'
				and BenzodiazepineDischarge.authoredOn during InpatientEncounter.period
        and BenzodiazepineDischarge.intent = 'order'
			return InpatientEncounter


define "Encounter with Two or More Concurrent Opioids at Discharge":
	"Inpatient Encounter with Age Greater than or Equal to 18" InpatientEncounter
		where Count(
			[MedicationRequest: "Schedule II and Schedule III Opioids"] Opioids
				where Opioids.authoredOn during InpatientEncounter.period
		) >= 2

define "Numerator":
 "Encounter with Two or More Concurrent Opioids at Discharge"
 union "Encounter with a Concurrent Opioid and Benzodiazepine at Discharge"
