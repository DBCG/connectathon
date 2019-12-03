library VTEICU_FHIR3 version '2.4.000'

/*
This example is a work in progress and should not be considered a final specification
or recommendation for guidance. This example will help guide and direct the process
of finding conventions and usage patterns that meet the needs of the various stakeholders
in the measure development community.
*/

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include MATGlobalCommonFunctions_FHIR3 version '2.0.000' called Common

// TODO: Determine how to reference a particular version of LOINC
codesystem "LOINC:2.46": 'http://loinc.org' version 'urn:hl7:version:2.46'
codesystem "SNOMEDCT:2016-03": 'http://snomed.info/sct/731000124108' version 'http://snomed.info/sct/731000124108/version/201603'

valueset "Intensive Care Unit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.23'

code "Birthdate": '21112-8' from "LOINC:2.46" display 'Birth date'
code "Dead": '419099009' from "SNOMEDCT:2016-03" display 'Dead'

parameter "Measurement Period" Interval<DateTime>

context Patient

define function "ToDate"(Value DateTime):
	DateTime(year from Value, month from Value, day from Value, 0, 0, 0, 0, timezone from Value)

define function "CalendarDayOfOrDayAfter"(StartValue DateTime):
	Interval[StartValue, ToDate(StartValue + 2 days))

define function "Start of First ICU"(Encounter "Encounter"):
	start of "First Intensive Care Unit"(Encounter).period

define function "First Intensive Care Unit"(Encounter "Encounter"):
	First(Encounter.location L
			where Common.GetLocation(L.location).type in "Intensive Care Unit"
				and L.period during Encounter.period
			sort by start of period
	)
