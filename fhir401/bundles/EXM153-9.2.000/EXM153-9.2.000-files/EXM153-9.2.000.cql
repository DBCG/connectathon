library EXM153 version '9.2.000'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include Hospice version '2.0.000' called Hospice
include MATGlobalCommonFunctions version '5.0.000' called Global
include SupplementalDataElements version '2.0.0' called SDE

codesystem "SNOMEDCT:2017-09":'http://snomed.info/sct/731000124108' version 'urn:hl7:version:2016-09'
codesystem "SNOMEDCT":'http://snomed.info/sct/731000124108'
codesystem "LOINC":'http://loinc.org'

valueset "Carrier of Predominantly Sexually Transmitted Infection":'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.112.11.1023'
valueset "Chlamydia":'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.112.12.1003'
valueset "Chlamydia Screening":'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1052'
valueset "Complications of Pregnancy, Childbirth and the Puerperium": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.111.12.1012'
valueset "Contraceptive Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1080'
valueset "Delivery Live Births": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.111.12.1015'
valueset "Diagnostic Studies During Pregnancy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.111.12.1008'
//valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "Female": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.560.100.2'
valueset "Genital Herpes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1049'
valueset "Gonococcal Infections and Venereal Diseases": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.112.12.1001'
valueset "HIV": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.120.12.1003'
valueset "Home Healthcare Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1016'
valueset "Inflammatory Diseases of Female Reproductive Organs": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.112.12.1004'
valueset "Isotretinoin": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1143'
valueset "Lab Tests During Pregnancy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.111.12.1007'
valueset "Lab Tests for Sexually Transmitted Infections": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1051'
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'
valueset "Other Female Reproductive Conditions": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.111.12.1006'
valueset "Pap Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1017'
//valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591'
valueset "Pregnancy Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.111.12.1011'
valueset "Preventive Care - Established Office Visit, 0 to 17": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1024'
valueset "Preventive Care Services - Established Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1025'
valueset "Preventive Care Services-Initial Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1023'
valueset "Preventive Care- Initial Office Visit, 0 to 17": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1022'
valueset "Procedures During Pregnancy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.111.12.1009'
valueset "Procedures Involving Contraceptive Devices": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.111.12.1010'
//valueset "Race": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.836'
valueset "Sexually Active": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.121.12.1040'
valueset "Syphilis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.112.12.1002'
valueset "X-Ray Study (all inclusive)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1034'

code "Birthdate": '21112-8' from "LOINC" display 'Birth date'
code "Yes (qualifier value)": '373066001' from "SNOMEDCT" display 'Yes (qualifier value)'

parameter "Measurement Period" Interval<DateTime>
  default Interval[@2019-01-01T00:00:00.0, @2020-01-01T00:00:00.0)

context Patient

define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
  SDE."SDE Payer"

define "SDE Race":
  SDE."SDE Race"

define "SDE Sex":
  SDE."SDE Sex"

define "Initial Population":
(Patient.gender = 'female'
		and Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of "Measurement Period") in Interval[16, 24])
    and exists ("Qualifying Encounters")
        and (exists ("Assessments Identifying Sexual Activity")
            or exists ("Diagnoses Identifying Sexual Activity")
            //or exists ("Active Contraceptive Medications")
            or exists ("Ordered Contraceptive Medications")
            or exists ("Laboratory Tests Identifying Sexual Activity")
            or exists ("Diagnostic Studies Identifying Sexual Activity")
            or exists ("Procedures Identifying Sexual Activity"))

define "Qualifying Encounters":
([Encounter: "Office Visit"]
    union ["Encounter": "Preventive Care Services - Established Office Visit, 18 and Up"]
    union ["Encounter": "Preventive Care Services-Initial Office Visit, 18 and Up"]
    union ["Encounter": "Preventive Care- Initial Office Visit, 0 to 17"]
    union ["Encounter": "Preventive Care - Established Office Visit, 0 to 17"]
    union ["Encounter": "Home Healthcare Services"]) ValidEncounter
    		where ValidEncounter.period during "Measurement Period"
            		and ValidEncounter.status  = 'finished'

define "Assessments Identifying Sexual Activity":
["Observation": "Sexually Active"] SexualActivityAssessment
  where SexualActivityAssessment.code ~ "Yes (qualifier value)"
      and SexualActivityAssessment.status in {'final', 'amended', 'corrected', 'preliminary'}
    and end of Global."Normalize Interval"(SexualActivityAssessment.effective) before end of "Measurement Period"

define "Diagnoses Identifying Sexual Activity":
(["Condition": "Other Female Reproductive Conditions"]
    union ["Condition": "Genital Herpes"]
    union ["Condition": "Gonococcal Infections and Venereal Diseases"]
    union ["Condition": "Inflammatory Diseases of Female Reproductive Organs"]
    union ["Condition": "Chlamydia"]
    union ["Condition": "HIV"]
    union ["Condition": "Syphilis"]
    union ["Condition": "Carrier of Predominantly Sexually Transmitted Infection"]
    union ["Condition": "Complications of Pregnancy, Childbirth and the Puerperium"]) SexualActivityDiagnosis
    where SexualActivityDiagnosis.verificationStatus ~ ToConcept(Global."confirmed")
        and Global."Prevalence Period"(SexualActivityDiagnosis) overlaps "Measurement Period"

// MedicationStatement changed to MedicationUsage in R5, so this cannot be referenced until a publisher issue is addressed
/*
define "Active Contraceptive Medications":
["MedicationStatement": "Contraceptive Medications"] ActiveContraceptives
    where ActiveContraceptives.status = 'active'
    and Global."Normalize Interval"(ActiveContraceptives.effective) overlaps "Measurement Period"
*/

define "Ordered Contraceptive Medications":
["MedicationRequest": "Contraceptive Medications"] OrderedContraceptives
    where OrderedContraceptives.status in {'active','completed'}
    and OrderedContraceptives.intent.value = 'order'
        and OrderedContraceptives.authoredOn during "Measurement Period"

define "Laboratory Tests Identifying Sexual Activity But Not Pregnancy":
(["ServiceRequest": "Pap Test"]
    union ["ServiceRequest": "Lab Tests During Pregnancy"]
    union ["ServiceRequest": "Lab Tests for Sexually Transmitted Infections"]) LabOrders
    where LabOrders.status in {'active', 'completed'}
    and LabOrders.intent.value = 'order'
    and LabOrders.authoredOn during "Measurement Period"

define "Laboratory Tests Identifying Sexual Activity":
( ["ServiceRequest": "Pregnancy Test"]
    union "Laboratory Tests Identifying Sexual Activity But Not Pregnancy" ) AllLabOrders
    where AllLabOrders.status in {'active', 'completed'}
    and AllLabOrders.intent.value = 'order'
    and AllLabOrders.authoredOn during "Measurement Period"

define "Diagnostic Studies Identifying Sexual Activity":
["ServiceRequest": "Diagnostic Studies During Pregnancy"] SexualActivityDiagnostics
    where SexualActivityDiagnostics.status in {'active', 'completed'}
    and SexualActivityDiagnostics.intent.value = 'order'
    and SexualActivityDiagnostics.authoredOn during "Measurement Period"

define "Procedures Identifying Sexual Activity":
( ["Procedure": "Delivery Live Births"]
    union ["Procedure": "Procedures During Pregnancy"]
    union ["Procedure": "Procedures Involving Contraceptive Devices"] ) ProceduresForSexualActivity
    where ProceduresForSexualActivity.status = 'completed'
    and Global."Normalize Interval"(ProceduresForSexualActivity.performed) during "Measurement Period"

define "Denominator":
"Initial Population"

define "Denominator Exclusions":
(exists ("Pregnancy Test Exclusion")
      and not exists ("Diagnoses Identifying Sexual Activity")
      //and not exists ("Active Contraceptive Medications")
      and not exists ("Laboratory Tests Identifying Sexual Activity But Not Pregnancy")
      and not exists ("Procedures Identifying Sexual Activity")
      and not exists ("Assessments Identifying Sexual Activity")
      and not exists ("Ordered Contraceptive Medications")
      and not exists ("Diagnostic Studies Identifying Sexual Activity"))
      or Hospice."Has Hospice"


define "Pregnancy Test Exclusion":
( ["ServiceRequest": "Pregnancy Test"] PregnancyTest
     with ["ServiceRequest": "X-Ray Study (all inclusive)"] XrayOrder
           such that XrayOrder.authoredOn occurs 7 days or less on or after day of PregnancyTest.authoredOn
           and XrayOrder.status in {'active','completed'}
           and XrayOrder.intent = 'order'
           and PregnancyTest.status in {'active','completed'}
           and PregnancyTest.intent = 'order'
           and PregnancyTest.authoredOn during "Measurement Period"

 )
   union ( ["ServiceRequest": "Pregnancy Test"] PregnancyTestOrder
       with ["MedicationRequest": "Isotretinoin"] AccutaneOrder
         such that AccutaneOrder.authoredOn occurs 7 days or less on or after day of PregnancyTestOrder.authoredOn
         and AccutaneOrder.status in {'active','completed'}
         and AccutaneOrder.intent = 'order'
         and PregnancyTestOrder.status in {'active','completed'}
         and PregnancyTestOrder.intent = 'order'
         and PregnancyTestOrder.authoredOn during "Measurement Period"
   )

define "Numerator":
exists (["Observation": "Chlamydia Screening"] ChlamydiaTest
     where ChlamydiaTest.status in {'preliminary', 'amended', 'corrected','final'}
     and ChlamydiaTest.value is not null
       and end of Global."Normalize Interval"(ChlamydiaTest.effective) during "Measurement Period")

define "Stratifaction 1":
Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of "Measurement Period") in Interval[16, 20]

define "Stratifaction 2":
Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of "Measurement Period") in Interval[21, 24]
