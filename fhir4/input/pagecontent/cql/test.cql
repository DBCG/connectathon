library test

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'

context Patient

define "Encounter Test 1":
	[Encounter: "Encounter Inpatient"]

define "Encounter Test 2":
	[Encounter]

define "Encounter Test 3":
	([Encounter] E
		where E.type.coding.code.value = {'32485007'})

define "Encounter Test 4":
	([Encounter] E
		where E.type.coding.code.value in "Encounter Inpatient")

define "Encounter Test 5":
	([Encounter] E
		where E.type.coding.code in "Encounter Inpatient")

define "Encounter Test 6":
	([Encounter] E
		where E.type.coding in "Encounter Inpatient")

define "Encounter Test 7":
	([Encounter] E
		where E.type in "Encounter Inpatient")
