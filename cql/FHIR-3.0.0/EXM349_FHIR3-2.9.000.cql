library EXM349_FHIR3 version '2.9.000'

/*
Based on CMS349v2 - HIV Screening
*/

using FHIR version '3.0.0'

include MATGlobalCommonFunctions_FHIR3 version '2.0.000' called Global
include FHIRHelpers version '3.0.0' called FHIRHelpers
include SupplementalDataElements_FHIR3 version '1.0.0' called SDE

codesystem "LOINC": 'urn:oid:2.16.840.1.113883.6.1'

valueset "Conditions Due To Human Immunodeficiency Virus (HIV)": 'urn:oid:2.16.840.1.113762.1.4.1056.54'
valueset "Ethnicity": 'urn:oid:2.16.840.1.114222.4.11.837'
valueset "Human Immunodeficiency Virus (HIV) Laboratory Test Codes (Ab and Ag)": 'urn:oid:2.16.840.1.113762.1.4.1056.50'
valueset "Office Visit": 'urn:oid:2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "ONC Administrative Sex": 'urn:oid:2.16.840.1.113762.1.4.1'
valueset "Payer": 'urn:oid:2.16.840.1.114222.4.11.3591'
valueset "Preventive Care Services - Established Office Visit, 18 and Up": 'urn:oid:2.16.840.1.113883.3.464.1003.101.12.1025'
valueset "Preventive Care Services, Initial Office Visit, 0 to 17": 'urn:oid:2.16.840.1.113883.3.464.1003.101.12.1022'
valueset "Preventive Care Services-Initial Office Visit, 18 and Up": 'urn:oid:2.16.840.1.113883.3.464.1003.101.12.1023'
valueset "Preventive Care, Established Office Visit, 0 to 17": 'urn:oid:2.16.840.1.113883.3.464.1003.101.12.1024'
valueset "Race": 'urn:oid:2.16.840.1.114222.4.11.836'

code "HIV 1 and 2 tests - Meaningful Use set": '75622-1' from "LOINC" display 'HIV 1 and 2 tests - Meaningful Use set'

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

define "Qualifying Encounters":
	( [Encounter: "Preventive Care Services, Initial Office Visit, 0 to 17"]
		union [Encounter: "Preventive Care Services-Initial Office Visit, 18 and Up"]
		union [Encounter: "Preventive Care, Established Office Visit, 0 to 17"]
		union [Encounter: "Preventive Care Services - Established Office Visit, 18 and Up"]
		union [Encounter: "Office Visit"] ) ValidEncounter
		where ValidEncounter.status = 'finished'
		and ValidEncounter.period during "Measurement Period"

define "Denominator":
	"Initial Population"

define "Denominator Exclusions":
	exists ( [Condition: code in "Conditions Due To Human Immunodeficiency Virus (HIV)"] HIVConditions
			where HIVConditions.clinicalStatus = 'active'
			and HIVConditions.verificationStatus = 'confirmed'
			and (HIVConditions.onset as dateTime) before start of "Measurement Period"
	)

define "Numerator":
	exists ( "HIV Test Performed" )

define "HIV Test Performed":
	( [Observation: "Human Immunodeficiency Virus (HIV) Laboratory Test Codes (Ab and Ag)"]
		union [Observation: "HIV 1 and 2 tests - Meaningful Use set"] ) HIVTest
		where exists ( Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of HIVTest.effective)>= 15
					and Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of HIVTest.effective)< 66
		)
			and HIVTest.status in {'final', 'amended', 'corrected', 'preliminary'}
			and HIVTest.effective starts before end of "Measurement Period"

define "Initial Population":
exists ( Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of "Measurement Period")>= 15
		and Global."CalendarAgeInYearsAt"(FHIRHelpers.ToDate(Patient.birthDate), start of "Measurement Period")< 66
	)
		and exists "Qualifying Encounters"
