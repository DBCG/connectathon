library EXM347 version '3.2.000'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElements version '2.0.0' called SDE
include MATGlobalCommonFunctions version '5.0.000' called Global

codesystem "LOINC": 'http://loinc.org'
codesystem "ICD10CM": 'http://hl7.org/fhir/sid/icd-10-cm'

valueset "Annual Wellness Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1240'
valueset "Atherosclerosis and Peripheral Arterial Disease": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1047.21'
valueset "Breastfeeding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1047.73'
valueset "CABG Surgeries": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.694'
valueset "CABG, PCI Procedure": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1138.566'
valueset "Carotid Intervention": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.204'
valueset "Cerebrovascular Disease, Stroke, TIA": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1047.44'
valueset "Diabetes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.103.12.1001'
valueset "End Stage Renal Disease": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.353'
valueset "Hepatitis A": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1024'
valueset "Hepatitis B": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.67.1.101.1.269'
valueset "High Intensity Statin Therapy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1572'
valueset "Hospice Care Ambulatory": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1584'
valueset "Hypercholesterolemia": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1047.100'
valueset "Ischemic Heart Disease or Other Related Diagnoses": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1047.46'
valueset "LDL Cholesterol": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1573'
valueset "Liver Disease": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1047.42'
valueset "Low Intensity Statin Therapy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1574'
valueset "Moderate Intensity Statin Therapy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1575'
valueset "Myocardial Infarction": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.403'
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "Outpatient Consultation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1008'
valueset "Outpatient Encounters for Preventive Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1576'
valueset "Palliative Care Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.600.1.1575'
valueset "Palliative or Hospice Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.600.1.1579'
valueset "PCI": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.67'
valueset "Pregnancy or Other Related Diagnoses": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.600.1.1623'
valueset "Preventive Care Services - Established Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1025'
valueset "Preventive Care Services - Other": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1030'
valueset "Preventive Care Services-Individual Counseling": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1026'
valueset "Preventive Care Services-Initial Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1023'
valueset "Rhabdomyolysis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1047.102'
valueset "Stable and Unstable Angina": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1047.47'
valueset "Statin Allergen": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.42'

//code "Birth date": '21112-8' from "LOINC" display 'Birth date'
code "Encounter for palliative care": 'Z51.5' from "ICD10CM" display 'Encounter for palliative care'

parameter "Measurement Period" Interval<DateTime>
  default Interval[@2019-01-01T00:00:00.0, @2020-01-01T00:00:00.0)

context Patient

define "Denominator Exceptions":
 "Patient Has Order for or Receiving Hospice Care or Palliative Care"
     or "Has ESRD"
     or "Has Hepatitis or Liver Disease"
     or exists "Adverse Reaction to Statin"
     or exists "Allergy or Intolerance to Statin"

define "Denominator Exceptions 3":
 "Patient Has Order for or Receiving Hospice Care or Palliative Care"
     or "Has ESRD"
     or "Has Hepatitis or Liver Disease"
     or exists "Adverse Reaction to Statin"
     or exists "Allergy or Intolerance to Statin"
     or "Most Recent LDL Result Within 3 Years is Less Than 70"

define "Most Recent LDL": //This definition is only used in "Last LDL Less Than 70", which is not used anywhere
 Last("LDL Test Result In Past 2 Years")

define "Numerator":
 exists "Statin Therapy Ordered During Measurement Period"
     or exists "Currently Taking Statin Therapy Through the End of the Measurement Period"

define "SDE Ethnicity":
 SDE."SDE Ethnicity"

define "SDE Payer":
 SDE."SDE Payer"

define "SDE Race":
 SDE."SDE Race"

define "SDE Sex":
 SDE."SDE Sex"

define "Active Statin Use":
 ([MedicationAdministration: "Low Intensity Statin Therapy"]
     union [MedicationAdministration: "Moderate Intensity Statin Therapy"]
     union [MedicationAdministration: "High Intensity Statin Therapy"]) StatinActive
     where StatinActive.status = 'in-progress'

define "Adverse Reaction to Statin":
//  [AdverseEvent: "Statin Allergen"] StatinReaction //AdverseEvent primary code path has a bug in it
//     where StatinReaction.date during "Measurement Period" //https://github.com/cqframework/clinical_quality_language/issues/549
  [AdverseEvent] StatinReaction //to remove once bug above is addressed
    where StatinReaction.date during "Measurement Period" //to remove once bug above is addressed
    and StatinReaction.event in "Statin Allergen" //to remove once bug above is addressed

define "Allergy or Intolerance to Statin":
 [AllergyIntolerance: "Statin Allergen"] StatinAllergyIntolerance
     where Global."Normalize Interval"(StatinAllergyIntolerance.onset) overlaps "Measurement Period"

define "Breastfeeding At Any Time During the Measurement Period":
 [Condition: "Breastfeeding"] Breastfeed
     where Global."Normalize Interval"(Breastfeed.onset) overlaps "Measurement Period"

define "Current or Prior LDL Result Greater Than or Equal To 190":
 [Observation: "LDL Cholesterol"] LDL
     where LDL.value >= 190 'mg/dL'
       and LDL.effective before
      end of "Measurement Period" //*could be effectivePeriod. May not clinically make sense for bp. Would the whole period have to be before end of MP?
    and LDL.status in {'final', 'amended', 'corrected', 'appended'}

define "Has ESRD":
 exists ( [Condition: "End Stage Renal Disease"] ESRD
       where Global."Normalize Interval"(ESRD.onset) overlaps "Measurement Period"
   )

define "Has Hepatitis or Liver Disease":
 exists ( ( [Condition: "Hepatitis A"]
       union [Condition: "Hepatitis B"]
       union [Condition: "Liver Disease"] ) HepatitisLiverDisease
       where Global."Normalize Interval"(HepatitisLiverDisease.onset) overlaps "Measurement Period"
   )

define "Highest LDL Result Within 3 Years is Greater Than or Equal To 70 and Less Than 190":
 ( Max([Observation: "LDL Cholesterol"] LDL
       where LDL.effective 3 years or less before //**3 or 4 years?
       end of "Measurement Period" //*
       and LDL.status in {'final', 'amended', 'corrected', 'appended'}
       return LDL.value as Quantity
   )) LDLResult
     where LDLResult in Interval[70 'mg/dL', 190 'mg/dL' )

define "LDL Test Result In Past 2 Years":
 [Observation: "LDL Cholesterol"] LDL
     where LDL.effective 3 years or less before //**2 or 3 years?
     end "Measurement Period" //*
       and LDL.value is not null
       and LDL.status in {'final', 'amended', 'corrected', 'appended'}
     sort by effective

define "Last LDL Less Than 70": //This definition is not used anywhere
//This can give a null, becaue "Most Recent LDL" gives last "LDL Test Result In Past 2 Years", and here it must be < 70
 "Most Recent LDL" RecentLDL
     where RecentLDL.value < 70 'mg/dL'

define "LDL 70 to 189 During or 2 Years Before Start of Measurement Period": //This definition is not used anywhere
 "LDL Between 70 and 189" LDLRange
     where Global."Normalize Interval"(LDLRange.effective) 3 years or less before
     end "Measurement Period" //*

define "LDL Between 70 and 189": //This definition is only used in "LDL 70 to 189 During or 2 Years Before Start of Measurement Period", which is not used anywhere
 [Observation: "LDL Cholesterol"] LDL
     where LDL.value < 190 'mg/dL'
       and LDL.value >= 70 'mg/dL'
       and LDL.status in {'final', 'amended', 'corrected', 'appended'}

define "Most Recent LDL Result Within 3 Years is Less Than 70":
 ( Last([Observation: "LDL Cholesterol"] LDL
         where Global."Normalize Interval"(LDL.effective) 3 years or less before //**3 or 4 years?
      end "Measurement Period" //*
      and LDL.status in {'final', 'amended', 'corrected', 'appended'}
       sort by effective
   )) MostRecentLDL
     return MostRecentLDL.value < 70 'mg/dL'

define "Pregnant At Any Time During the Measurement Period":
 [Condition: "Pregnancy or Other Related Diagnoses"] Pregnancy
     where Global."Normalize Interval"(Pregnancy.onset) overlaps "Measurement Period"

define "Qualifying Encounter During Measurement Period":
 ( [Encounter: "Annual Wellness Visit"]
       union [Encounter: "Office Visit"]
     union [Encounter: "Outpatient Consultation"]
     union [Encounter: "Outpatient Encounters for Preventive Care"]
      union [Encounter: "Preventive Care Services - Established Office Visit, 18 and Up"]
      union [Encounter: "Preventive Care Services - Other"]
      union [Encounter: "Preventive Care Services-Individual Counseling"]
      union [Encounter: "Preventive Care Services-Initial Office Visit, 18 and Up"] ) ValidEncounter
      where ValidEncounter.period during "Measurement Period"
      and ValidEncounter.status = 'finished'

define "Qualifying Encounters": //This definition is not used anywhere
  ([Encounter: "Annual Wellness Visit"]
     union [Encounter: "Office Visit"]
     union [Encounter: "Outpatient Consultation"]
     union [Encounter: "Outpatient Encounters for Preventive Care"]
     union [Encounter: "Preventive Care Services - Established Office Visit, 18 and Up"]
     union [Encounter: "Preventive Care Services - Other"]
     union [Encounter: "Preventive Care Services-Individual Counseling"]
     union [Encounter: "Preventive Care Services-Initial Office Visit, 18 and Up"]) ValidEncounter
     where ValidEncounter.status = 'finished'

define "Statin Therapy Ordered During Measurement Period":
 ( [MedicationRequest: "Low Intensity Statin Therapy"]
     union [MedicationRequest: "Moderate Intensity Statin Therapy"]
     union [MedicationRequest: "High Intensity Statin Therapy"] ) StatinOrdered
     where StatinOrdered.authoredOn during "Measurement Period"
     and StatinOrdered.status in {'active', 'completed'}

define "Denominator Exclusions":
 exists ( ( [Condition: "Rhabdomyolysis"]
       union [Condition: "Breastfeeding"]
       union [Condition: "Pregnancy or Other Related Diagnoses"] ) ExclusionDiagnosis
       where Global."Normalize Interval"(ExclusionDiagnosis.onset) overlaps "Measurement Period"
   )

define "Initial Population":
  "Patients Age 21 or Over at Start of Measurement Period"
     and exists "Qualifying Encounter During Measurement Period"

define "Has Diabetes":
 exists ( [Condition: "Diabetes"] Diabetes
       where Global."Normalize Interval"(Diabetes.onset) starts before end of "Measurement Period"
   )

define "Patients Age 21 or Over at Start of Measurement Period":
 //exists [Patient: "Birth date"] BirthDate
//     where Global."CalendarAgeInYearsAt"( FHIRHelpers.ToDate(BirthDate.birthDate), start of "Measurement Period" ) >= 21
Global."CalendarAgeInYearsAt"( FHIRHelpers.ToDate(Patient.birthDate), start of "Measurement Period" ) >= 21

define "Patient Age 40 to 75 at Start of Measurement Period":
// exists [Patient: "Birth date"] BirthDate
//     where Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(BirthDate.birthDate), start of "Measurement Period") >= 40
//       and Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(BirthDate.birthDate), start of "Measurement Period") <= 75
    Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of "Measurement Period") in Interval[40, 75]

define "Patient Has Order for or Receiving Hospice Care or Palliative Care":
 exists (([ServiceRequest: "Hospice Care Ambulatory"]
       union [ServiceRequest: "Palliative or Hospice Care"]) PalliativeOrHospiceCareOrder
       where PalliativeOrHospiceCareOrder.authoredOn on or before
       end of "Measurement Period"
       and PalliativeOrHospiceCareOrder.status in {'active', 'on-hold', 'completed'}
   )
     or exists ( ( [Procedure: "Hospice Care Ambulatory"]
         union [Procedure: "Palliative or Hospice Care"]) PalliativeOrHospiceCarePerformed
         //union [Encounter: "Encounter for palliative care"] ) PalliativeOrHospiceCarePerformed
         where Global."Normalize Interval"(PalliativeOrHospiceCarePerformed.performed) starts on or before //previously used "period", which is not in Procedure
         end of "Measurement Period"
         and PalliativeOrHospiceCarePerformed.status = 'completed' //Encounter.status cannot equal 'completed'. Need to break out Encoutner into its own clause
     )
     or exists ([Encounter: "Encounter for palliative care"] PalliativeEncounter
         where PalliativeEncounter.period starts on or before
         end of "Measurement Period"
         and PalliativeEncounter.status = 'finished'
        )

define "Currently Taking Statin Therapy Through the End of the Measurement Period":
 ( [MedicationRequest: "Low Intensity Statin Therapy"]
     union [MedicationRequest: "Moderate Intensity Statin Therapy"]
     union [MedicationRequest: "High Intensity Statin Therapy"] ) ActiveStatin
     where ActiveStatin.dispenseRequest.validityPeriod overlaps after "Measurement Period"
     and ActiveStatin.status in {'active', 'completed'}

define "Has Hypercholesterolemia":
 exists ([Condition: "Hypercholesterolemia"] Hypercholesterolemia
       where Global."Normalize Interval"(Hypercholesterolemia.onset) starts before
       end of "Measurement Period")

define "ASCVD Diagnosis or Procedure Before End of Measurement Period":
 ( ( [Condition: "Myocardial Infarction"] //For these and all conditions in this measure, consider using Condition.clinicalStatus and .verificationStatus. See http://hl7.org/fhir/us/qicore/qdm-to-qicore.html#88-diagnosis
       union [Condition: "Cerebrovascular Disease, Stroke, TIA"]
       union [Condition: "Atherosclerosis and Peripheral Arterial Disease"]
       union [Condition: "Ischemic Heart Disease or Other Related Diagnoses"]
       union [Condition: "Stable and Unstable Angina"] ) ASCVDDiagnosis
       where Global."Normalize Interval"(ASCVDDiagnosis.onset) starts before
       end of "Measurement Period"
   )
     union ( ( [Procedure: "PCI"]
         union [Procedure: "CABG Surgeries"]
         union [Procedure: "Carotid Intervention"]
         union [Procedure: "CABG, PCI Procedure"] ) ASCVDProcedure
         where Global."Normalize Interval"(ASCVDProcedure.performed) starts before
         end of "Measurement Period"
         and ASCVDProcedure.status = 'completed'
       )

define "Denominator 1":
 "Initial Population"
     and exists ("ASCVD Diagnosis or Procedure Before End of Measurement Period")

define "Denominator 2":
 "Initial Population"
     and ( exists "Current or Prior LDL Result Greater Than or Equal To 190"
         or "Has Hypercholesterolemia"
     )
     and not exists "ASCVD Diagnosis or Procedure Before End of Measurement Period"

define "Denominator 3":
"Initial Population"
     and "Patient Age 40 to 75 at Start of Measurement Period"
     and "Has Diabetes"
     and "Highest LDL Result Within 3 Years is Greater Than or Equal To 70 and Less Than 190" is not null
     and not exists "ASCVD Diagnosis or Procedure Before End of Measurement Period"
     and not exists "Current or Prior LDL Result Greater Than or Equal To 190"
      and not "Has Hypercholesterolemia"
