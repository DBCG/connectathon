library EXM117_FHIR3 version '1.0.1'

/*
Childhood Immunization Screening (CIS)
*/

//using FHIR version '3.0.1'
using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include MATGlobalCommonFunctions_FHIR3 version '2.0.000' called Global

/*
Description
Percentage of children 2 years of age who had four diphtheria, tetanus and acellular pertussis (DTaP); three polio (IPV), one measles, mumps and rubella (MMR); three H influenza type B (HiB); three hepatitis B (Hep B); one chicken pox (VZV); four pneumococcal conjugate (PCV); one hepatitis A (Hep A); two or three rotavirus (RV); and two influenza (flu) vaccines by their second birthday
*/


codesystem "CPT": 'http://www.ama-assn.org/'
codesystem "CVX": 'http://www2a.cdc.gov/'
codesystem "SNOMEDCT": 'http://snomed.org'

// valueset "Alcohol Screening and Brief Counseling": 'urn:oid:1.1.1.1' // User Defined QDM Value Set
valueset "Anaphylactic Reaction to Common Baker's Yeast": 'urn:oid:2.16.840.1.113883.3.464.1003.199.12.1032'
valueset "Anaphylactic Reaction to DTaP Vaccine": 'urn:oid:2.16.840.1.113883.3.464.1003.199.12.1031'
valueset "Anaphylactic Reaction to Hepatitis A Vaccine": 'urn:oid:2.16.840.1.113883.3.464.1003.199.12.1026'
valueset "Anti Hepatitis A IgG Antigen Test": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1033'
valueset "Anti Hepatitis B Virus Surface Ab": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1073'
valueset "Disorders of the Immune System": 'urn:oid:2.16.840.1.113883.3.464.1003.120.12.1001'
valueset "DTaP Vaccine Administered": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1022'
valueset "DTaP Vaccine": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1214'
valueset "Encephalopathy due to Childhood Vaccination": 'urn:oid:2.16.840.1.113883.3.464.1003.114.12.1007'
valueset "Encounter Inpatient": 'urn:oid:2.16.840.1.113883.3.666.5.307'
valueset "Ethnicity": 'urn:oid:2.16.840.1.114222.4.11.837'
valueset "Haemophilus Influenzae Type B (HiB) Vaccine Administered": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1043'
valueset "Haemophilus Influenzae Type B (HiB) Vaccine": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1217'
valueset "Hepatitis A Vaccine Administered": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1041'
valueset "Hepatitis A Vaccine": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1215'
valueset "Hepatitis A": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1024'
valueset "Hepatitis B Vaccine Administered": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1042'
valueset "Hepatitis B Vaccine": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1216'
valueset "Hepatitis B": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1025'
valueset "HIV": 'urn:oid:2.16.840.1.113883.3.464.1003.120.12.1003'
valueset "Home Healthcare Services": 'urn:oid:2.16.840.1.113883.3.464.1003.101.12.1016'
valueset "Hospice care ambulatory": 'urn:oid:2.16.840.1.113762.1.4.1108.15'
valueset "Inactivated Polio Vaccine (IPV) Administered": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1045'
valueset "Inactivated Polio Vaccine (IPV)": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1219'
valueset "Influenza Vaccine Administered": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1044'
valueset "Influenza Vaccine": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1218'
valueset "Intussusception": 'urn:oid:2.16.840.1.113883.3.464.1003.199.12.1056'
valueset "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue": 'urn:oid:2.16.840.1.113883.3.464.1003.108.12.1009'
valueset "Measles Antibody Test (IgG Antibody presence)": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1060'
valueset "Measles Antibody Test (IgG Antibody Titer)": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1059'
valueset "Measles": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1053'
valueset "Measles, Mumps and Rubella (MMR) Vaccine Administered": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1031'
valueset "Measles, Mumps and Rubella (MMR) Vaccine": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1224'
valueset "Mumps Antibody Test (IgG Antibody presence)": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1062'
valueset "Mumps Antibody Test (IgG Antibody Titer)": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1061'
valueset "Mumps": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1032'
valueset "Office Visit": 'urn:oid:2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "ONC Administrative Sex": 'urn:oid:2.16.840.1.113762.1.4.1'
valueset "Payer": 'urn:oid:2.16.840.1.114222.4.11.3591'
valueset "Pneumococcal Conjugate Vaccine Administered": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1046'
valueset "Pneumococcal Conjugate Vaccine": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1221'
valueset "Positive Finding": 'urn:oid:2.16.840.1.113883.3.464.1003.121.12.1016'
valueset "Preventive Care Services, Initial Office Visit, 0 to 17": 'urn:oid:2.16.840.1.113883.3.464.1003.101.12.1022'
valueset "Preventive Care, Established Office Visit, 0 to 17": 'urn:oid:2.16.840.1.113883.3.464.1003.101.12.1024'
valueset "Race": 'urn:oid:2.16.840.1.114222.4.11.836'
valueset "Rotavirus Vaccine (3 dose schedule)": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1223'
valueset "Rubella Antibody Test (IgG Antibody presence)": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1064'
valueset "Rubella Antibody Test (IgG Antibody Titer)": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1063'
valueset "Rubella": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1037'
valueset "Severe Combined Immunodeficiency": 'urn:oid:2.16.840.1.113883.3.464.1003.120.12.1007'
valueset "Varicella Zoster Antibody Test (IgG Antibody Presence)": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1067'
valueset "Varicella Zoster Antibody Test (IgG Antibody Titer)": 'urn:oid:2.16.840.1.113883.3.464.1003.198.12.1066'
valueset "Varicella Zoster Vaccine (VZV) Administered": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1040'
valueset "Varicella Zoster Vaccine (VZV)": 'urn:oid:2.16.840.1.113883.3.464.1003.196.12.1170'
valueset "Varicella Zoster": 'urn:oid:2.16.840.1.113883.3.464.1003.110.12.1039'

// BTR -> Codes must come after value sets
code "Anaphylaxis due to Haemophilus influenzae type b vaccine (disorder)": '433621000124101' from "SNOMEDCT"
code "Anaphylaxis due to Hepatitis B vaccine (disorder)": '433621000124101'from "SNOMEDCT"
code "Anaphylaxis due to rotavirus vaccine (disorder)": '428331000124103' from "SNOMEDCT"
code "Discharge to healthcare facility for hospice care (procedure)": '428371000124100' from "SNOMEDCT"
code "Discharge to home for hospice care (procedure)": '428361000124107' from "SNOMEDCT"
code "Influenza virus vaccine adverse reaction (disorder)": '420113004' from "SNOMEDCT"
code "Neomycin adverse reaction (disorder)": '292927007' from "SNOMEDCT"
code "Pneumococcal vaccine adverse reaction (disorder)": '293116002' from "SNOMEDCT"
code "Poliomyelitis vaccine adverse reaction (disorder)": '293117006' from "SNOMEDCT"
code "Polymyxin B adverse reaction (disorder)": '292992006' from "SNOMEDCT"
code "Rotavirus vaccine, human, attenuated (RV1), 2 dose schedule, live, for oral use": '90681' from "SNOMEDCT"
code "Rotavirus vaccine, pentavalent (RV5), 3 dose schedule, live, for oral use": '90680' from "CPT"
code "rotavirus, live, monovalent vaccine": '119' from "CVX"
code "Streptomycin adverse reaction (disorder)": '292925004' from "SNOMEDCT"

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

/*
Initial Population
*/

define "Initial Population":
		Global."CalendarAgeInYearsAt"(Patient.birthDate,  "Measurement Period")>= 1
		//the below statement makes the above statement unnecessary because in order for
		//the patient to be 2 by the end of the Measurement Period they must be >= 1 befor the end
				and Global."CalendarAgeInYearsAt"(Patient.birthDate, end of "Measurement Period")= 2
		and exists ( "Qualifying Encounter" )
//		and (not "Is In Hospice")


define "Denominator":
	// was "Initial Population", but that will always be true if this expression is executed
    true



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
//
define "Is In Hospice":
	exists(
		[Encounter: "Hospice Value Set"] Enc
			where Enc.status.value in { 'planned', 'arrived', 'triaged', 'in-progress', 'onleave', 'finished' }
				and PeriodToIntervalOfDT(Enc.period) overlaps day of "Measurement Period"
	)
	or
	exists(
		[Claim: "Hospice Value Set"] Clm
			where Clm.status.value in { 'active', 'draft' }
				and PeriodToIntervalOfDT(Clm.item.service.period) overlaps day of "Measurement Period"
	)
	or
	exists(
		[Encounter: "Encounter Inpatient"] DischargeHospice
			where DischargeHospice.status.value in { 'planned', 'arrived', 'triaged', 'in-progress', 'onleave', 'finished' }
				and (CodingToCode(DischargeHospice.hospitalization.dischargeDisposition.coding)
						in "Discharged to Home for Hospice Care"
					or CodingToCode(DischargeHospice.hospitalization.dischargeDisposition.coding)
						in "Discharged to Health Care Facility for Hospice Care")
				and PeriodToIntervalOfDT(DischargeHospice.period) ends during day of "Measurement Period"
	)
	or
	exists(
		[ProcedureRequest: "Hospice care ambulatory"] HospiceOrder
			where HospiceOrder.status.value in { 'active', 'completed' }
				and HospiceOrder.authoredOn.value during "Measurement Period"
	)
	or
	exists(
		[Procedure: "Hospice care ambulatory"] HospicePerformed
			where HospicePerformed.status.value in { 'preparation', 'in-progress', 'suspended', 'aborted', 'completed' }
				and date form PeriodToIntervalOfDT(HospicePerformed.performed) overlaps day of "Measurement Period"
	)
*/




define "DTaP Immunizations or Procedures":

	( ["Immunization":"DTaP Vaccine"] DTaP
				where DTaP.status.value = 'completed' )

			and (( Global."CalendarAgeInDaysAt"(Patient.birthDate, DTaPVaccination.date)>= 42 )
				and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, DTaPVaccination.date)<= Patient.birthDate + 2 years ))



define "DTaP Numerator Inclusion Conditions":

	( ["Condition": "Anaphylactic Reaction to DTaP Vaccine"]
		union ["Condition": "Encephalopathy due to Childhood Vaccination"] ) DTaPConditions
			where DTaPConditions.verificationStatus.value = 'confirmed'
				and( Global."CalendarAgeInDaysAt"(Patient.birthDate, DTaPConditions.onset)<= Patient.birthDate + 2 years )


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

define "Hepatitis A Numerator Inclusion Conditions":

	( ( ["Observation": "Anti Hepatitis A IgG Antigen Test"] HepatitisAAntigenTest
			where HepatitisAAntigenTest.status.value in ('final' , 'amended')
				and HepatitisAAntigenTest.value as Code in "Positive Finding"
//Bryn - can you do "as Code in "Positive Finding""?
// BTR -> You can, but you don't need to since the membership test is treating value as a Code, the translator will just cast it
	)
		union ( ["Condition": "Anaphylactic Reaction to Hepatitis A Vaccine"] HepatitisAReaction
				return "Observation" { effective: HepatitisAReaction.onset }
		)
		union ( ["Condition": "Hepatitis A"] HepatitisADiagnosis
				return "Observation" { effective: HepatitisADiagnosis.onset }
		) ) HepatitisAConditions
			where ( Global."CalendarAgeInDaysAt"(Patient.birthDate, HepatitisAConditions.effective)<= Patient.birthDate + 2 years )

define "Hepatitis B Immunizations or Procedures":

	( ["Immunization": "Hepatitis B Vaccine"] HepatitisBVaccination
		where HepatitisBVaccination.status.value = 'completed' )
			where Global."CalendarAgeInDaysAt"(Patient.birthDate, HepatitisBVaccination.date)<= Patient.birthDate + 2 years

define "Hepatitis B Numerator Inclusion Conditions":

	( ( ["Observation": "Anti Hepatitis B Virus Surface Ab"] HepatitisBAntigenTest
			where HepatitisBAntigenTest.result as Code in "Positive Finding"
			and HepatitisBAntigenTest.status.value in ('final', 'amended')
	)
		union ( ["Condition": "Anaphylaxis due to Hepatitis B vaccine (disorder)"] HepatitisBReaction
				return "Observation" { effective:  HepatitisBReaction.onset }
		)
		union ( ["Condition": "Anaphylactic Reaction to Common Baker's Yeast"] YeastReaction
				return "Observation" { effective:  YeastReaction.onset }
		)
		union ( ["Condition": "Hepatitis B"] HepatitisBDiagnosis
				return "Observation" { effective:  HepatitisBDiagnosis.onset }
		) ) HepBConditions
			where ( Global."CalendarAgeInDaysAt"(Patient.birthDate, HepBConditions.effective)<= Patient.birthDate + 2 years )

define "Hib Immunizations or Procedures":

	( ["Immunization": "Haemophilus Influenzae Type B (HiB) Vaccine"] HibVaccination
			where HibVaccination.status.value = 'completed' )
			and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, HibVaccination.date)>= 42 )
				and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, HibVaccination.date)<= Patient.birthDate + 2 years )


define "Hib Numerator Inclusion Conditions":

	["Condition": "Anaphylaxis due to Haemophilus influenzae type b vaccine (disorder)"] HibReaction
where Global."CalendarAgeInDaysAt"(Patient.birthDate,  HibReaction.onset)<= Patient.birthDate + 2 years


define "Influenza Immunizations or Procedures":

	( ["Immunization": "Influenza Vaccine"] InfluenzaVaccination
			where InfluenzaVaccination.status.value = 'completed' )
				and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, InfluenzaVaccination.date)>= 180 )
				and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, InfluenzaVaccination.date)<= Patient.birthDate + 2 years )

define "Influenza Numerator Inclusion Conditions":

	( ["Condition": "Influenza virus vaccine adverse reaction (disorder)"]
		union ["Condition": "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue"]
		union ["Condition": "Neomycin adverse reaction (disorder)"]
		union ["Condition": "HIV"]
		union ["Condition": "Disorders of the Immune System"] ) InfluenzaConditions
where Global."CalendarAgeInDaysAt"(Patient.birthDate, InfluenzaConditions.onset)<= Patient.birthDate + 2 years


define "Measles Indicators":

	( ( ["Observation": "Measles Antibody Test (IgG Antibody Titer)"] MeaslesTiter
			where MeaslesTiter.status.value in ('final' , 'amended')
			and MeaslesTiter.result >= 1.10
	)
		union ( ["Observation": "Measles Antibody Test (IgG Antibody presence)"] MeaslesIgGPresence
				where MeaslesIgGPresence.status.value in ('final' , 'amended')
				and MeaslesIgGPresence.result as Code in "Positive Finding"
		)
		union ( ["Condition": "Measles"] MeaslesDiagnosis
				return "Observation" { effective:  MeaslesDiagnosis.onset }
		) ) Measles
where Global."CalendarAgeInDaysAt"(Patient.birthDate, Measles.effective)<= Patient.birthDate + 2 years

define "MMR Numerator Inclusion Conditions":

	( ["Condition": "Disorders of the Immune System"]
		union ["Condition": "HIV"]
		union ["Condition": "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue"]
		union ["Condition": "Neomycin adverse reaction (disorder)"] ) MMRConditions
where Global."CalendarAgeInDaysAt"(Patient.birthDate,  MMRConditions.onset)<= Patient.birthDate + 2 years

define "Mumps Indicators":

	( ( ["Observation": "Mumps Antibody Test (IgG Antibody Titer)"] MumpsTiter
			where MumpsTiter.status.value in ('final' , 'amended')
			and MumpsTiter.result >= 1.10
	)
		union ( ["Observation": "Mumps Antibody Test (IgG Antibody presence)"] MumpsIgGPresence
				where MumpsIgGPresence.status.value in ('final' , 'amended')
				and MumpsIgGPresence.result as Code in "Positive Finding"
		)
		union ( ["Condition": "Mumps"] MumpsDiagnosis
				return "Observation" { effective:  MumpsDiagnosis.onset }
		) ) Mumps
where Global."CalendarAgeInDaysAt"(Patient.birthDate, Mumps.effective)<= Patient.birthDate + 2 years


define "One Chicken Pox Vaccination":

	( ["Immunization": "Varicella Zoster Vaccine (VZV)"] ChickenPoxVaccination
				where ChickenPoxVaccination.status.value = 'completed' )
				and Global."CalendarAgeInDaysAt"(Patient.birthDate, ChickenPoxVaccination.date)<= Patient.birthDate + 2 years

define "One Hepatitis A Vaccinations":

	( ["Immunization": "Hepatitis A Vaccine"] HepatitisAVaccination
			where HepatitisAVaccination.status.value = 'completed' )
			and Global."CalendarAgeInDaysAt"(Patient.birthDate, HepatitisAVaccination.date)<= Patient.birthDate + 2 years

define "One MMR Vaccinations":

	( ["Immunization": "Measles, Mumps and Rubella (MMR) Vaccine"] MMRVaccination
		where MMRVaccination.status.value = 'completed' )
		and Global."CalendarAgeInDaysAt"(Patient.birthDate, MMRVaccination.date)<= Patient.birthDate + 2 years

define "Pneumococcal Conjugate Immunizations or Procedures":

	( ["Immunization": "Pneumococcal Conjugate Vaccine"] PneumococcalVaccination
			where PneumococcalVaccination.status.value = 'completed' )
				and( Global."CalendarAgeInDaysAt"(Patient.birthDate, PneumococcalVaccination.date)>= 42 )
				and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, PneumococcalVaccination.date)<= Patient.birthDate + 2 years )

define "Pneumococcal Conjugate Numerator Inclusion Conditions":

	["Condition": "Pneumococcal vaccine adverse reaction (disorder)"] PneumococcalReaction
where Global."CalendarAgeInDaysAt"(Patient.birthDate, PneumococcalReaction.onset)<= Patient.birthDate + 2 years

define "Polio Immunizations or Procedures":

	( ["Immunization": "Inactivated Polio Vaccine (IPV)"] PolioVaccination
			where PolioVaccination.status.value = 'completed' )
			and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, PolioVaccination.date)>= 42 )
			and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, PolioVaccination.date)<= Patient.birthDate + 2 years )

define "Polio Numerator Inclusion Conditions":

	( ["Condition": "Poliomyelitis vaccine adverse reaction (disorder)"]
		union ["Condition": "Streptomycin adverse reaction (disorder)"]
		union ["Condition": "Polymyxin B adverse reaction (disorder)"]
		union ["Condition": "Neomycin adverse reaction (disorder)"] ) PolioConditions
where Global."CalendarAgeInDaysAt"(Patient.birthDate, PolioConditions.onset)<= Patient.birthDate + 2 years
  
define "Qualifying Encounter":

	( ["Encounter, Performed": "Office Visit"]
		union ["Encounter, Performed": "Home Healthcare Services"]
		union ["Encounter, Performed": "Preventive Care, Established Office Visit, 0 to 17"]
		union ["Encounter, Performed": "Preventive Care Services, Initial Office Visit, 0 to 17"] ) ValidEncounter
		where ValidEncounter.relevantPeriod during "Measurement Period"

define "Rotavirus 2 Dose Immunizations or Procedures":

	( ["Immunization": "rotavirus, live, monovalent vaccine"] TwoDoseRotavirus
			where TwoDoseRotavirus.status.value = 'completed' )
			  and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, TwoDoseRotavirus.date)>= 42 )
				and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, TwoDoseRotavirus.date)<= Patient.birthDate + 2 years )

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

define "Rotavirus 2 or 3 Dose Vaccinations":

	( "Rotavirus 2 Dose Vaccination Followed by Two Rotavirus 3 Dose Vaccinations"
			union "Rotavirus 3 Dose Vaccination Followed by A Rotavirus 2 Dose Vaccination and A Rotavirus 3 Dose Vaccination"
			union "Rotavirus 3 Dose Vaccinations Followed by One Rotavirus 2 Dose Vaccination"
	)

define "Rotavirus 3 Dose Immunizations or Procedures":

	( ["Immunization": "Rotavirus Vaccine (3 dose schedule)"] ThreeDoseRotavirus
			where ThreeDoseRotavirus.status.value = 'completed' )
				and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, ThreeDoseRotavirus.date)>= 42 )
				and ( Global."CalendarAgeInDaysAt"(Patient.birthDate, ThreeDoseRotavirus.date)<= Patient.birthDate + 2 years )

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

	( ( ["Condition": "Anaphylaxis due to rotavirus vaccine (disorder)"]
			union ["Condition": "Severe Combined Immunodeficiency"]
			union ["Condition": "Intussusception"] ) RotavirusConditions
			with ["Patient Characteristic Birthdate"] BirthDate
				such that Global."CalendarAgeInDaysAt"(Patient.birthDate,  RotavirusConditions.onset)<= Patient.birthDate + 2 years
	)

define "Rubella Indicators":

	( ( ["Observation": "Rubella Antibody Test (IgG Antibody Titer)"] RubellaTiter
			where RubellaTiter.status.value in ('final' , 'amended')
			and RubellaTiter.result >= 1.10
	)
		union ( ["Observation": "Rubella Antibody Test (IgG Antibody presence)"] RubellaIgGPresence
				where RubellaIgGPresence.status.value in ('final' , 'amended')
				and RubellaIgGPresence.result as Code in "Positive Finding"
		)
		union ( ["Condition": "Rubella"] RubellaDiagnosis
				return "Observation" { effective:  RubellaDiagnosis.onset }
		) ) Rubella
where Global."CalendarAgeInDaysAt"(Patient.birthDate, Rubella.effective)<= Patient.birthDate + 2 years



define "Three Hepatitis B Vaccinations":

	from
		"Hepatitis B Immunizations or Procedures" HepatitisBVaccination1,
		"Hepatitis B Immunizations or Procedures" HepatitisBVaccination2,
		"Hepatitis B Immunizations or Procedures" HepatitisBVaccination3
		where HepatitisBVaccination2.date 1 day or more after day of HepatitisBVaccination1.date
			and HepatitisBVaccination3.date 1 day or more after day of HepatitisBVaccination2.date
		return HepatitisBVaccination1

define "Three Hib Vaccinations":

	from
		"Hib Immunizations or Procedures" HiBVaccination1,
		"Hib Immunizations or Procedures" HiBVaccination2,
		"Hib Immunizations or Procedures" HiBVaccination3
		where HiBVaccination2.date 1 day or more after day of HiBVaccination1.date
			and HiBVaccination3.date 1 day or more after day of HiBVaccination2.date
		return HiBVaccination1

define "Three Polio Vaccinations":

	from
		"Polio Immunizations or Procedures" PolioVaccination1,
		"Polio Immunizations or Procedures" PolioVaccination2,
		"Polio Immunizations or Procedures" PolioVaccination3
		where PolioVaccination2.date 1 day or more after day of PolioVaccination1.date
			and PolioVaccination3.date 1 day or more after day of PolioVaccination2.date
		return PolioVaccination1

define "Two Influenza Vaccinations":

	from
		"Influenza Immunizations or Procedures" FluVaccination1,
		"Influenza Immunizations or Procedures" FluVaccination2
		where FluVaccination2.date 1 day or more after day of FluVaccination1.date
		return FluVaccination1

define "Varicella Zoster Numerator Inclusion Conditions":

	( ( ["Observation": "Varicella Zoster Antibody Test (IgG Antibody Titer)"] ChickenPoxTiter
	    where ChickenPoxTiter.status.value in ('final' , 'amended')
			and ChickenPoxTiter.result >= 1.10
	)
		union ( ["Observation": "Varicella Zoster Antibody Test (IgG Antibody Presence)"] ChickenPoxIgGPresence
				where ChickenPoxIgGPresence.status.value in ('final' , 'amended')
				and ChickenPoxIgGPresence.result as Code in "Positive Finding"
		)
		union ( ["Condition": "Disorders of the Immune System"] ImmuneDisorder
				return "Observation" { effective:  ImmuneDisorder.onset }
		)
		union ( ["Condition": "HIV"] HIV
				return "Observation" { effective:  HIV.onset }
		)
		union ( ["Condition": "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue"] LymphaticMalignantNeoplasm
				return "Observation" { effective:  LymphaticMalignantNeoplasm.onset }
		)
		union ( ["Condition": "Neomycin adverse reaction (disorder)"] NeomycinReaction
				return "Observation" { effective:  NeomycinReaction.onset }
		)
		union ( ["Condition": "Varicella Zoster"] VaricellaZoster
				return "Observation" { effective:  VaricellaZoster.onset }
		) ) VaricellaZosterConditions
			where ( Global."CalendarAgeInDaysAt"(Patient.birthDate, VaricellaZosterConditions.effective)<= Patient.birthDate + 2 years )
