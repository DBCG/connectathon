library EXM117_FHIR3 version '8.3.000'

/*
Childhood Immunization Screening (CIS)
*/

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include MATGlobalCommonFunctions_FHIR3 version '2.0.000' called Global
include SupplementalDataElements_FHIR3 version '1.0.0' called SDE
include Hospice_FHIR3 version '1.0.000' called Hospice

/*
Description
Percentage of children 2 years of age who had four diphtheria, tetanus and acellular pertussis (DTaP); three polio (IPV), one measles, mumps and rubella (MMR); three H influenza type B (HiB); three hepatitis B (Hep B); one chicken pox (VZV); four pneumococcal conjugate (PCV); one hepatitis A (Hep A); two or three rotavirus (RV); and two influenza (flu) vaccines by their second birthday
*/

codesystem "CPT": 'http://www.ama-assn.org/'
codesystem "CVX": 'http://www2a.cdc.gov/'
codesystem "SNOMEDCT": 'http://snomed.info/sct/731000124108'
codesystem "LOINC": 'http://loinc.org'

valueset "Anaphylactic Reaction to Common Baker's Yeast": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.199.12.1032'
valueset "Anaphylactic Reaction to DTaP Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.199.12.1031'
valueset "Anaphylactic Reaction to Hepatitis A Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.199.12.1026'
valueset "Anti Hepatitis A IgG Antigen Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1033'
valueset "Anti Hepatitis B Virus Surface Ab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1073'
valueset "Disorders of the Immune System": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.120.12.1001'
valueset "DTaP Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1022'
valueset "DTaP Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1214'
valueset "Encephalopathy due to Childhood Vaccination": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.114.12.1007'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "Haemophilus Influenzae Type B (HiB) Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1043'
valueset "Haemophilus Influenzae Type B (HiB) Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1217'
valueset "Hepatitis A Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1041'
valueset "Hepatitis A Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1215'
valueset "Hepatitis A": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1024'
valueset "Hepatitis B Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1042'
valueset "Hepatitis B Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1216'
valueset "Hepatitis B": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1025'
valueset "HIV": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.120.12.1003'
valueset "Home Healthcare Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1016'
valueset "Hospice care ambulatory": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1108.15'
valueset "Inactivated Polio Vaccine (IPV) Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1045'
valueset "Inactivated Polio Vaccine (IPV)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1219'
valueset "Influenza Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1044'
valueset "Influenza Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1218'
valueset "Intussusception": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.199.12.1056'
valueset "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1009'
valueset "Measles Antibody Test (IgG Antibody presence)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1060'
valueset "Measles Antibody Test (IgG Antibody Titer)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1059'
valueset "Measles": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1053'
valueset "Measles, Mumps and Rubella (MMR) Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1031'
valueset "Measles, Mumps and Rubella (MMR) Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1224'
valueset "Mumps Antibody Test (IgG Antibody presence)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1062'
valueset "Mumps Antibody Test (IgG Antibody Titer)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1061'
valueset "Mumps": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1032'
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'
valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591'
valueset "Pneumococcal Conjugate Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1046'
valueset "Pneumococcal Conjugate Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1221'
valueset "Positive Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.121.12.1016'
valueset "Preventive Care Services, Initial Office Visit, 0 to 17": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1022'
valueset "Preventive Care, Established Office Visit, 0 to 17": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1024'
valueset "Race": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.836'
valueset "Rotavirus Vaccine (3 dose schedule)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1223'
valueset "Rubella Antibody Test (IgG Antibody presence)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1064'
valueset "Rubella Antibody Test (IgG Antibody Titer)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1063'
valueset "Rubella": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1037'
valueset "Severe Combined Immunodeficiency": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.120.12.1007'
valueset "Varicella Zoster Antibody Test (IgG Antibody Presence)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1067'
valueset "Varicella Zoster Antibody Test (IgG Antibody Titer)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1066'
valueset "Varicella Zoster Vaccine (VZV) Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1040'
valueset "Varicella Zoster Vaccine (VZV)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1170'
valueset "Varicella Zoster": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1039'

// BTR -> Codes must come after value sets
code "Birth date": '21112-8' from "LOINC" display 'Birth date'
code "Anaphylaxis due to Haemophilus influenzae type b vaccine (disorder)": '433621000124101' from "SNOMEDCT" display 'Anaphylaxis due to Haemophilus influenzae type b vaccine (disorder)'
code "Anaphylaxis due to Hepatitis B vaccine (disorder)": '433621000124101'from "SNOMEDCT" display 'Anaphylaxis due to Hepatitis B vaccine (disorder)'
code "Anaphylaxis due to rotavirus vaccine (disorder)": '428331000124103' from "SNOMEDCT" display 'Anaphylaxis due to rotavirus vaccine (disorder)'
code "Discharge to healthcare facility for hospice care (procedure)": '428371000124100' from "SNOMEDCT" display 'Discharge to healthcare facility for hospice care (procedure)'
code "Discharge to home for hospice care (procedure)": '428361000124107' from "SNOMEDCT" display 'Discharge to home for hospice care (procedure)'
code "Influenza virus vaccine adverse reaction (disorder)": '420113004' from "SNOMEDCT" display 'Influenza virus vaccine adverse reaction (disorder)'
code "Neomycin adverse reaction (disorder)": '292927007' from "SNOMEDCT" display 'Neomycin adverse reaction (disorder)'
code "Pneumococcal vaccine adverse reaction (disorder)": '293116002' from "SNOMEDCT" display 'Pneumococcal vaccine adverse reaction (disorder)'
code "Poliomyelitis vaccine adverse reaction (disorder)": '293117006' from "SNOMEDCT" display 'Poliomyelitis vaccine adverse reaction (disorder)'
code "Polymyxin B adverse reaction (disorder)": '292992006' from "SNOMEDCT" display 'Polymyxin B adverse reaction (disorder)'
code "Rotavirus vaccine, human, attenuated (RV1), 2 dose schedule, live, for oral use": '90681' from "SNOMEDCT" display 'Rotavirus vaccine, human, attenuated (RV1), 2 dose schedule, live, for oral use'
code "Rotavirus vaccine, pentavalent (RV5), 3 dose schedule, live, for oral use": '90680' from "CPT" display 'Rotavirus vaccine, pentavalent (RV5), 3 dose schedule, live, for oral use'
code "Rotavirus, live, monovalent vaccine": '119' from "CVX" display 'Rotavirus, live, monovalent vaccine'
code "Streptomycin adverse reaction (disorder)": '292925004' from "SNOMEDCT" display 'Streptomycin adverse reaction (disorder)'

/*
This library has an explicit parameter which is the measurement year.
While the actual parameter type accepts all intervals, this library
expects it will only be given arguments corresponding exactly to one whole
calendar year, and it will not behave properly otherwise; 2017 for example:
Interval[DateTime(2017,1,1,0,0,0,0), DateTime(2018,1,1,0,0,0,0))
*/

parameter "Measurement Period" Interval<DateTime>
/*
This library evaluates with respect to exactly 1 candidate patient at a time,
that patient being given by the special context parameter Patient.
*/

context Patient


define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
   SDE."SDE Payer"

define "SDE Race":
  SDE."SDE Race"

define "SDE Sex":
   SDE."SDE Sex"

/*
Initial Population
*/

define "Initial Population":
		Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate),  start of "Measurement Period")>= 1
				and Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), end of "Measurement Period")= 2
		and exists ( "Qualifying Encounter" )
		and (not Hospice."Has Hospice"("Measurement Period"))

define "Qualifying Encounter":
	( ["Encounter": "Office Visit"]
		union ["Encounter": "Home Healthcare Services"]
		union ["Encounter": "Preventive Care, Established Office Visit, 0 to 17"]
		union ["Encounter": "Preventive Care Services, Initial Office Visit, 0 to 17"] ) ValidEncounter
		where ValidEncounter.status = 'finished'
			and ValidEncounter.period during "Measurement Period"

define "Denominator":
	"Initial Population"

define "Numerator":

	( exists ( "Four DTaP Vaccinations" )
			or exists ( "DTaP Numerator Inclusion Conditions" )
	)
		and ( exists ( "Three Polio Vaccinations" )
				or exists ( "Polio Numerator Inclusion Conditions" )
		)
		and ( exists ( "One MMR Vaccinations" )
				or exists ( "MMR Numerator Inclusion Conditions" )
				or ( exists ( "Measles Indicators" )
						and exists ( "Mumps Indicators" )
						and exists ( "Rubella Indicators" )
				)
		)
		and ( exists ( "Three Hib Vaccinations" )
				or exists ( "Hib Numerator Inclusion Conditions" )
		)
		and ( exists ( "Three Hepatitis B Vaccinations" )
				or exists ( "Hepatitis B Numerator Inclusion Conditions" )
		)
		and ( exists ( "One Chicken Pox Vaccination" )
				or exists ( "Varicella Zoster Numerator Inclusion Conditions" )
		)
		and ( exists ( "Four Pneumococcal Conjugate Vaccinations" )
				or exists ( "Pneumococcal Conjugate Numerator Inclusion Conditions" )
		)
		and ( exists ( "One Hepatitis A Vaccinations" )
				or exists ( "Hepatitis A Numerator Inclusion Conditions" )
		)
		and ( exists ( "Rotavirus 2 Dose Vaccinations" )
				or exists ( "Rotavirus Numerator Inclusion Conditions" )
				or exists ( "Rotavirus 2 or 3 Dose Vaccinations" )
				or exists ( "Rotavirus 3 Dose Vaccinations" )
		)
		and ( exists ( "Two Influenza Vaccinations" )
				or exists ( "Influenza Numerator Inclusion Conditions" "Numerator Compliant Influenza Conditions" )
		)

/* How do we enact the Hospice Library
// BTR -> Add an include for Hospice_FHIR, we've already translated that to FHIR, then you can just reference it
*/
 define "Four DTaP Vaccinations":
	from
		"DTaP Immunizations or Procedures" DTaPVaccination1,
		"DTaP Immunizations or Procedures" DTaPVaccination2,
		"DTaP Immunizations or Procedures" DTaPVaccination3,
		"DTaP Immunizations or Procedures" DTaPVaccination4
		where DTaPVaccination2.date 1 day or more after day of DTaPVaccination1.date
			and DTaPVaccination3.date 1 day or more after day of DTaPVaccination2.date
			and DTaPVaccination4.date 1 day or more after day of DTaPVaccination3.date
		return DTaPVaccination1

define "DTaP Immunizations or Procedures":
	["Immunization" : "DTaP Vaccine"] DTaP
		where DTaP.status = 'completed'
			and ( Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), DTaP.date) >= 42 )
			and (
        Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), DTaP.date)
          <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, DTaP.date)
      )

define "DTaP Numerator Inclusion Conditions":
	(
    ["Condition": "Anaphylactic Reaction to DTaP Vaccine"]
		  union ["Condition": "Encephalopathy due to Childhood Vaccination"]
  ) DTaPConditions
		  where DTaPConditions.verificationStatus = 'confirmed'
				and (
          Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), DTaPConditions.onset."start")
            <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, DTaPConditions.onset."start")
        )

define "Three Polio Vaccinations":
	from
    "Polio Immunizations or Procedures" PolioVaccination1,
		"Polio Immunizations or Procedures" PolioVaccination2,
		"Polio Immunizations or Procedures" PolioVaccination3
		where PolioVaccination2.date 1 day or more after day of PolioVaccination1.date
			and PolioVaccination3.date 1 day or more after day of PolioVaccination2.date
		return PolioVaccination1

 define "Polio Immunizations or Procedures":
	["Immunization": "Inactivated Polio Vaccine (IPV)"] PolioVaccination
		where PolioVaccination.status ~ 'completed'
		and (Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), PolioVaccination.date) >= 42 )
		and (
      Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), PolioVaccination.date)
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, PolioVaccination.date)
    )

define "Polio Numerator Inclusion Conditions":
	( ["Condition": "Poliomyelitis vaccine adverse reaction (disorder)"]
		union ["Condition": "Streptomycin adverse reaction (disorder)"]
		union ["Condition": "Polymyxin B adverse reaction (disorder)"]
		union ["Condition": "Neomycin adverse reaction (disorder)"] ) PolioConditions
			where PolioConditions.verificationStatus ~ 'confirmed'
				and (
          Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), PolioConditions.onset."start")
            <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, PolioConditions.onset."start")
        )

define "One MMR Vaccinations":
	["Immunization": "Measles, Mumps and Rubella (MMR) Vaccine"] MMRVaccination
		where MMRVaccination.status ~ 'completed'
		and (
      Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), MMRVaccination.date)
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, MMRVaccination.date)
    )

define "MMR Numerator Inclusion Conditions":
	(
    ["Condition": "Disorders of the Immune System"]
  		union ["Condition": "HIV"]
  		union ["Condition": "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue"]
  		union ["Condition": "Neomycin adverse reaction (disorder)"]
  ) MMRConditions
			where MMRConditions.verificationStatus ~ 'confirmed'
				and (
          Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), MMRConditions.onset."start")
            <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, MMRConditions.onset."start")
        )

define "Measles Indicators":
	(
    (
      ["Observation": "Measles Antibody Test (IgG Antibody Titer)"] MeaslesTiter
      	where MeaslesTiter.status in {'final', 'amended'}
      	and MeaslesTiter.value >= 1.10
    )
		union (
      ["Observation": "Measles Antibody Test (IgG Antibody presence)"] MeaslesIgGPresence
  			where MeaslesIgGPresence.status in {'final', 'amended'}
  			and MeaslesIgGPresence.interpretation in "Positive Finding"
		)
		union (
      ["Condition": "Measles"] MeaslesDiagnosis
  			where MeaslesDiagnosis.verificationStatus ~ 'confirmed'
  			return "Observation" { effective: MeaslesDiagnosis.onset }
		)
  ) Measles
			where Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), Measles.effective."start")
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, Measles.effective."start")

define "Mumps Indicators":
	(
    (
      ["Observation": "Mumps Antibody Test (IgG Antibody Titer)"] MumpsTiter
      	where MumpsTiter.status in {'final', 'amended'}
      	and MumpsTiter.value >= 1.10
    )
		union (
      ["Observation": "Mumps Antibody Test (IgG Antibody presence)"] MumpsIgGPresence
  			where MumpsIgGPresence.status in {'final', 'amended'}
  			and MumpsIgGPresence.interpretation in "Positive Finding"
		)
		union (
      ["Condition": "Mumps"] MumpsDiagnosis
  			where MumpsDiagnosis.verificationStatus ~ 'confirmed'
  			return "Observation" { effective: MumpsDiagnosis.onset }
		)
  ) Measles
			where Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), Measles.effective."start")
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, Measles.effective."start")

define "Rubella Indicators":
	(
    (
      ["Observation": "Rubella Antibody Test (IgG Antibody Titer)"] RubellaTiter
      	where RubellaTiter.status in {'final', 'amended'}
      	and RubellaTiter.value >= 1.10
    )
		union (
      ["Observation": "Rubella Antibody Test (IgG Antibody presence)"] RubellaIgGPresence
  			where RubellaIgGPresence.status in {'final', 'amended'}
  			and RubellaIgGPresence.interpretation in "Positive Finding"
		)
		union (
      ["Condition": "Rubella"] RubellaDiagnosis
  			where RubellaDiagnosis.verificationStatus ~ 'confirmed'
  			return "Observation" { effective: RubellaDiagnosis.onset }
		)
  ) Rubella
			where Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), Rubella.effective."start")
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, Rubella.effective."start")

define "Three Hib Vaccinations":
	from
		"Hib Immunizations or Procedures" HiBVaccination1,
		"Hib Immunizations or Procedures" HiBVaccination2,
		"Hib Immunizations or Procedures" HiBVaccination3
		where HiBVaccination2.date 1 day or more after day of HiBVaccination1.date
			and HiBVaccination3.date 1 day or more after day of HiBVaccination2.date
		return HiBVaccination1

define "Hib Immunizations or Procedures":
	["Immunization": "Haemophilus Influenzae Type B (HiB) Vaccine"] HibVaccination
		where HibVaccination.status ~ 'completed'
		and ( Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), HibVaccination.date) >= 42 )
		and (
      Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), HibVaccination.date)
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, HibVaccination.date)
    )

define "Hib Numerator Inclusion Conditions":
	["Condition": "Anaphylaxis due to Haemophilus influenzae type b vaccine (disorder)"] HibReaction
		where HibReaction.verificationStatus ~ 'confirmed'
			and (
        Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), HibReaction.onset."start")
          <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, HibReaction.onset."start")
      )

define "Three Hepatitis B Vaccinations":
	from
		"Hepatitis B Immunizations or Procedures" HepatitisBVaccination1,
		"Hepatitis B Immunizations or Procedures" HepatitisBVaccination2,
		"Hepatitis B Immunizations or Procedures" HepatitisBVaccination3
		where HepatitisBVaccination2.date 1 day or more after day of HepatitisBVaccination1.date
			and HepatitisBVaccination3.date 1 day or more after day of HepatitisBVaccination2.date
		return HepatitisBVaccination1

define "Hepatitis B Immunizations or Procedures":
	["Immunization": "Hepatitis B Vaccine"] HepatitisBVaccination
		where HepatitisBVaccination.status = 'completed'
		and (
      Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), HepatitisBVaccination.date)
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, HepatitisBVaccination.date)
    )

define "Hepatitis B Numerator Inclusion Conditions":
	(
    (
      ["Observation": "Anti Hepatitis B Virus Surface Ab"] HepatitisBAntigenTest
      	where HepatitisBAntigenTest.status in {'final', 'amended'}
      	and HepatitisBAntigenTest.interpretation in "Positive Finding"
    )
		union (
      ["Condition": "Anaphylaxis due to Hepatitis B vaccine (disorder)"] HepatitisBReaction
				where HepatitisBReaction.verificationStatus ~ 'confirmed'
				return "Observation" { effective:  HepatitisBReaction.onset }
		)
		union (
      ["Condition": "Anaphylactic Reaction to Common Baker's Yeast"] YeastReaction
				where YeastReaction.verificationStatus ~ 'confirmed'
				return "Observation" { effective:  YeastReaction.onset }
		)
		union (
      ["Condition": "Hepatitis B"] HepatitisBDiagnosis
				where HepatitisBDiagnosis.verificationStatus = 'confirmed'
				return "Observation" { effective:  HepatitisBDiagnosis.onset }
		)
  ) HepBConditions
			where (
        Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), HepBConditions.effective."start")
          <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, HepBConditions.effective."start")
      )

define "One Chicken Pox Vaccination":
	["Immunization": "Varicella Zoster Vaccine (VZV)"] ChickenPoxVaccination
		where ChickenPoxVaccination.status ~ 'completed'
		and (
      Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), ChickenPoxVaccination.date)
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, ChickenPoxVaccination.date)
    )

define "Varicella Zoster Numerator Inclusion Conditions":
	(
    (
      ["Observation": "Varicella Zoster Antibody Test (IgG Antibody Titer)"] ChickenPoxTiter
        where ChickenPoxTiter.status in {'final' , 'amended'}
          and ChickenPoxTiter.value >= 1.10
    )
		union (
      ["Observation": "Varicella Zoster Antibody Test (IgG Antibody Presence)"] ChickenPoxIgGPresence
				where ChickenPoxIgGPresence.status in {'final' , 'amended'}
				and ChickenPoxIgGPresence.interpretation in "Positive Finding"
		)
		union (
      ["Condition": "Disorders of the Immune System"] ImmuneDisorder
				where ImmuneDisorder.verificationStatus ~ 'confirmed'
				return "Observation" { effective: ImmuneDisorder.onset }
		)
		union (
      ["Condition": "HIV"] HIV
				where HIV.verificationStatus ~ 'confirmed'
				return "Observation" { effective: HIV.onset }
		)
		union (
      ["Condition": "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue"] LymphaticMalignantNeoplasm
				where LymphaticMalignantNeoplasm.verificationStatus ~ 'confirmed'
				return "Observation" { effective: LymphaticMalignantNeoplasm.onset }
		)
		union (
      ["Condition": "Neomycin adverse reaction (disorder)"] NeomycinReaction
				where NeomycinReaction.verificationStatus ~ 'confirmed'
				return "Observation" { effective: NeomycinReaction.onset }
		)
		union (
      ["Condition": "Varicella Zoster"] VaricellaZoster
				where VaricellaZoster.verificationStatus ~ 'confirmed'
				return "Observation" { effective: VaricellaZoster.onset }
		)
  ) VaricellaZosterConditions
			where (
        Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), VaricellaZosterConditions.effective."start")
          <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, VaricellaZosterConditions.effective."start")
      )

define "Four Pneumococcal Conjugate Vaccinations":
	from
		"Pneumococcal Conjugate Immunizations or Procedures" PneumococcalVaccination1,
		"Pneumococcal Conjugate Immunizations or Procedures" PneumococcalVaccination2,
		"Pneumococcal Conjugate Immunizations or Procedures" PneumococcalVaccination3,
		"Pneumococcal Conjugate Immunizations or Procedures" PneumococcalVaccination4
  		where PneumococcalVaccination2.date 1 day or more after day of PneumococcalVaccination1.date
  			and PneumococcalVaccination3.date 1 day or more after day of PneumococcalVaccination2.date
  			and PneumococcalVaccination4.date 1 day or more after day of PneumococcalVaccination3.date
  		return PneumococcalVaccination1

define "Pneumococcal Conjugate Immunizations or Procedures":
  ["Immunization": "Pneumococcal Conjugate Vaccine"] PneumococcalVaccination
    where PneumococcalVaccination.status ~ 'completed'
    and ( Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), PneumococcalVaccination.date) >= 42 )
    and (
      Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), PneumococcalVaccination.date)
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, PneumococcalVaccination.date)
    )

define "Pneumococcal Conjugate Numerator Inclusion Conditions":
	["Condition": "Pneumococcal vaccine adverse reaction (disorder)"] PneumococcalReaction
		where PneumococcalReaction.verificationStatus ~ 'confirmed'
			and (
        Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), PneumococcalReaction.onset."start")
          <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, PneumococcalReaction.onset."start")
      )

define "One Hepatitis A Vaccinations":
	["Immunization": "Hepatitis A Vaccine"] HepatitisAVaccination
		where HepatitisAVaccination.status ~ 'completed'
		and (
      Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), HepatitisAVaccination.date)
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, HepatitisAVaccination.date)
    )

define "Hepatitis A Numerator Inclusion Conditions":
	(
    (
      ["Observation": "Anti Hepatitis A IgG Antigen Test"] HepatitisAAntigenTest
        where HepatitisAAntigenTest.status in {'final' , 'amended'}
        	and HepatitisAAntigenTest.interpretation in "Positive Finding"
    )
		union (
      ["Condition": "Anaphylactic Reaction to Hepatitis A Vaccine"] HepatitisAReaction
				where HepatitisAReaction.verificationStatus ~ 'confirmed'
				return "Observation" { effective: HepatitisAReaction.onset }
		)
		union (
      ["Condition": "Hepatitis A"] HepatitisADiagnosis
				where HepatitisADiagnosis.verificationStatus ~ 'confirmed'
				return "Observation" { effective: HepatitisADiagnosis.onset }
		)
  ) HepatitisAConditions
			where (
        Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), HepatitisAConditions.effective."start")
          <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, HepatitisAConditions.effective."start")
      )

define "Rotavirus 2 Dose Immunizations or Procedures":
  ["Immunization": "Rotavirus, live, monovalent vaccine"] TwoDoseRotavirus
  	where TwoDoseRotavirus.status ~ 'completed'
  	and ( Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), TwoDoseRotavirus.date) >= 42 )
  	and (
      Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), TwoDoseRotavirus.date)
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, TwoDoseRotavirus.date)
    )

define "Rotavirus 3 Dose Immunizations or Procedures":
  ["Immunization": "Rotavirus Vaccine (3 dose schedule)"] ThreeDoseRotavirus
  	where ThreeDoseRotavirus.status ~ 'completed'
  	and ( Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), ThreeDoseRotavirus.date) >= 42 )
  	and (
      Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), ThreeDoseRotavirus.date)
        <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, ThreeDoseRotavirus.date)
    )

define "Rotavirus 2 or 3 Dose Vaccinations":
  "Rotavirus 2 Dose Vaccination Followed by Two Rotavirus 3 Dose Vaccinations"
  	union "Rotavirus 3 Dose Vaccination Followed by A Rotavirus 2 Dose Vaccination and A Rotavirus 3 Dose Vaccination"
  	union "Rotavirus 3 Dose Vaccinations Followed by One Rotavirus 2 Dose Vaccination"

define "Rotavirus 2 Dose Vaccination Followed by Two Rotavirus 3 Dose Vaccinations":
	from
		"Rotavirus 2 Dose Immunizations or Procedures" Rotavirus233Vaccination1,
		"Rotavirus 3 Dose Immunizations or Procedures" Rotavirus233Vaccination2,
		"Rotavirus 3 Dose Immunizations or Procedures" Rotavirus233Vaccination3
		where Rotavirus233Vaccination2.date 1 day or more after day of Rotavirus233Vaccination1.date
			and Rotavirus233Vaccination3.date 1 day or more after day of Rotavirus233Vaccination2.date
		return Rotavirus233Vaccination1

define "Rotavirus 2 Dose Vaccinations":
	from
		"Rotavirus 2 Dose Immunizations or Procedures" Rotavirus2Vaccination1,
		"Rotavirus 2 Dose Immunizations or Procedures" Rotavirus2Vaccination2
		where Rotavirus2Vaccination2.date 1 day or more after day of Rotavirus2Vaccination1.date
		return Rotavirus2Vaccination1

define "Rotavirus 3 Dose Vaccination Followed by A Rotavirus 2 Dose Vaccination and A Rotavirus 3 Dose Vaccination":
	from
		"Rotavirus 3 Dose Immunizations or Procedures" Rotavirus323Vaccination1,
		"Rotavirus 2 Dose Immunizations or Procedures" Rotavirus323Vaccination2,
		"Rotavirus 3 Dose Immunizations or Procedures" Rotavirus323Vaccination3
		where Rotavirus323Vaccination2.date 1 day or more after day of Rotavirus323Vaccination1.date
			and Rotavirus323Vaccination3.date 1 day or more after day of Rotavirus323Vaccination2.date
		return Rotavirus323Vaccination1

define "Rotavirus 3 Dose Vaccinations":
	from
		"Rotavirus 3 Dose Immunizations or Procedures" Rotavirus3Vaccination1,
		"Rotavirus 3 Dose Immunizations or Procedures" Rotavirus3Vaccination2,
		"Rotavirus 3 Dose Immunizations or Procedures" Rotavirus3Vaccination3
		where Rotavirus3Vaccination2.date 1 day or more after day of Rotavirus3Vaccination1.date
			and Rotavirus3Vaccination3.date 1 day or more after day of Rotavirus3Vaccination2.date
		return Rotavirus3Vaccination1

define "Rotavirus 3 Dose Vaccinations Followed by One Rotavirus 2 Dose Vaccination":
	from
		"Rotavirus 3 Dose Immunizations or Procedures" Rotavirus332Vaccination1,
		"Rotavirus 3 Dose Immunizations or Procedures" Rotavirus332Vaccination2,
		"Rotavirus 2 Dose Immunizations or Procedures" Rotavirus332Vaccination3
		where Rotavirus332Vaccination2.date 1 day or more after day of Rotavirus332Vaccination1.date
			and Rotavirus332Vaccination3.date 1 day or more after day of Rotavirus332Vaccination2.date
		return Rotavirus332Vaccination1

define "Rotavirus Numerator Inclusion Conditions":
	(
    ["Condition": "Anaphylaxis due to rotavirus vaccine (disorder)"]
			union ["Condition": "Severe Combined Immunodeficiency"]
			union ["Condition": "Intussusception"]
  ) RotavirusConditions
			where RotavirusConditions.verificationStatus ~ 'confirmed'
				and (
          Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate),  RotavirusConditions.onset."start")
            <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years,  RotavirusConditions.onset."start")
        )

 define "Two Influenza Vaccinations":
	from
		"Influenza Immunizations or Procedures" FluVaccination1,
		"Influenza Immunizations or Procedures" FluVaccination2
  		where FluVaccination2.date 1 day or more after day of FluVaccination1.date
  		return FluVaccination1

define "Influenza Immunizations or Procedures":
  ["Immunization": "Influenza Vaccine"] InfluenzaVaccination
  	where InfluenzaVaccination.status ~ 'completed'
  		and ( Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), InfluenzaVaccination.date) >= 180 )
  		and (
        Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), InfluenzaVaccination.date)
          <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, InfluenzaVaccination.date)
      )

define "Influenza Numerator Inclusion Conditions":
	(
    ["Condition": "Influenza virus vaccine adverse reaction (disorder)"]
  		union ["Condition": "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue"]
  		union ["Condition": "Neomycin adverse reaction (disorder)"]
  		union ["Condition": "HIV"]
  		union ["Condition": "Disorders of the Immune System"]
  ) InfluenzaConditions
			where InfluenzaConditions.verificationStatus ~ 'confirmed'
				and (
          Global."CalendarAgeInDaysAt"(FHIRHelpers.ToDate(Patient.birthDate), InfluenzaConditions.onset."start")
            <= Global."CalendarAgeInDaysAt"(Patient.birthDate + 2 years, InfluenzaConditions.onset."start")
        )
