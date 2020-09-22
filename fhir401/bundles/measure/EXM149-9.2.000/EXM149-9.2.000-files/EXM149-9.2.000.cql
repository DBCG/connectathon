library EXM149 version '9.2.000'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include MATGlobalCommonFunctions version '5.0.000' called Global
include SupplementalDataElements version '2.0.0' called SDE

valueset "Behavioral/Neuropsych Assessment": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1023'
valueset "Care Services in Long-Term Residential Facility": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1014'
valueset "Cognitive Assessment": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1332'
valueset "Dementia & Mental Degenerations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1005'
valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "Home Healthcare Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1016'
valueset "Nursing Facility Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1012'
valueset "Occupational Therapy Evaluation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1011'
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'
valueset "Outpatient Consultation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1008'
valueset "Patient Provider Interaction": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1012'
valueset "Patient Reason": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1008'
valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591'
valueset "Psych Visit - Diagnostic Evaluation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1492'
valueset "Psych Visit - Psychotherapy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1496'
valueset "Race": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.836'
valueset "Standardized Tools for Assessment of Cognition": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1006'

parameter "Measurement Period" Interval<DateTime>
  default Interval[@2019-01-01T00:00:00.0, @2020-01-01T00:00:00.0)

context Patient

// May want to consider clinical status = 'active'
// May want to consider verificationStatus = 'confirmed'
define "Dementia Encounter":
  "Face to Face Encounter During Measurement Period" ValidFaceToFaceEncounter
    with ["Condition": "Dementia & Mental Degenerations"] Dementia
      such that Global."Normalize Interval"(Dementia.onset) overlaps ValidFaceToFaceEncounter.period

define "Denominator":
  "Initial Population"

define "Face to Face Encounter During Measurement Period":
  ( ["Encounter": "Psych Visit - Diagnostic Evaluation"]
    union ["Encounter": "Nursing Facility Visit"]
    union ["Encounter": "Care Services in Long-Term Residential Facility"]
    union ["Encounter": "Home Healthcare Services"]
    union ["Encounter": "Psych Visit - Psychotherapy"]
    union ["Encounter": "Behavioral/Neuropsych Assessment"]
    union ["Encounter": "Occupational Therapy Evaluation"]
    union ["Encounter": "Office Visit"]
    union ["Encounter": "Outpatient Consultation"] ) FaceToFaceEncounter
    where FaceToFaceEncounter.period during "Measurement Period" and
      FaceToFaceEncounter.status in {'in-progress', 'finished'}

define "Initial Population":
  exists "Dementia Encounter"
    and ( Count("Qualifying Encounter")>= 2 )

define "Numerator":
  exists "Assessment of Cognition Using Standardized Tools or Alternate Methods"

define "Qualifying Encounter":
  ( ["Encounter": "Psych Visit - Diagnostic Evaluation"]
    union ["Encounter": "Nursing Facility Visit"]
    union ["Encounter": "Care Services in Long-Term Residential Facility"]
    union ["Encounter": "Home Healthcare Services"]
    union ["Encounter": "Patient Provider Interaction"]
    union ["Encounter": "Psych Visit - Psychotherapy"]
    union ["Encounter": "Behavioral/Neuropsych Assessment"]
    union ["Encounter": "Occupational Therapy Evaluation"]
    union ["Encounter": "Office Visit"]
    union ["Encounter": "Outpatient Consultation"] ) ValidEncounter
    where ValidEncounter.period during "Measurement Period" and
      ValidEncounter.status in {'in-progress', 'finished'}

define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
  SDE."SDE Payer"

define "SDE Race":
  SDE."SDE Race"

define "SDE Sex":
  SDE."SDE Sex"

define "Denominator Exceptions":
  exists "Patient Reason for Not Performing Assessment of Cognition Using Standardized Tools"
  or exists "Patient Reason for Not Performing Assessment of Cognition Using Alternate Methods"

define "Assessment of Cognition Using Standardized Tools":
  ( ["Observation": "Standardized Tools for Assessment of Cognition"]) CognitiveMeasurement
    with "Dementia Encounter" EncounterDementia
      such that Global."Normalize Interval"(CognitiveMeasurement.effective) 12 months or less on or before day of
      end of EncounterDementia.period
    where CognitiveMeasurement.status in {'final', 'amended', 'corrected'} and CognitiveMeasurement.value is not null

define "Assessment of Cognition Using Alternative Methods":
  ( ["Procedure": "Cognitive Assessment"] ) CognitiveAssessment
    with "Dementia Encounter" EncounterDementia
      such that Global."Normalize Interval"(CognitiveAssessment.performed) 12 months or less on or before day of
      end of EncounterDementia.period
    where CognitiveAssessment.status = 'completed'

// Might want to consider observation.category
define "Assessment of Cognition Using Standardized Tools or Alternate Methods":
  "Assessment of Cognition Using Standardized Tools" union "Assessment of Cognition Using Alternative Methods"

define "Patient Reason for Not Performing Assessment of Cognition Using Standardized Tools":
  (["Observation": "Standardized Tools for Assessment of Cognition"]) NoCognitiveAssessment
  with "Dementia Encounter" EncounterDementia
    such that Global."Normalize Interval"(NoCognitiveAssessment.effective) during EncounterDementia.period
  where "GetNotDoneModifierExtension"(NoCognitiveAssessment).value is true
  and Global."GetExtension"(NoCognitiveAssessment, 'qicore-notDoneReason').value.coding in "Patient Reason"
  and NoCognitiveAssessment.status = 'final'

define "Patient Reason for Not Performing Assessment of Cognition Using Alternate Methods":
( ["Procedure": "Cognitive Assessment"] ) NoCognitiveAssessment
  with "Dementia Encounter" EncounterDementia
    such that Global."Normalize Interval"(NoCognitiveAssessment.performed) during EncounterDementia.period
  where NoCognitiveAssessment.status = 'not-done' and NoCognitiveAssessment.statusReason in "Patient Reason"

define function "GetNotDoneModifierExtension"(domainResource DomainResource):
  singleton from (domainResource.modifierExtension E
	  where E.url = ('http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDone'))
