library EXM529 version '1.0.000'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include MATGlobalCommonFunctions version '5.0.000' called Global
include SupplementalDataElements version '2.0.0' called SDE

codesystem "LOINC": 'http://loinc.org'

valueset "Bicarbonate Lab Test":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.139'
valueset "Body Temperature LOINC":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.152'
valueset "Body Weight":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.159'
valueset "Creatinine Lab Test":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.2363'
valueset "Emergency Department Visit":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Encounter Inpatient":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Glucose Lab Test":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.134'
valueset "Hematocrit lab test":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.114'
valueset "Medicare payer":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1104.10'
valueset "Potassium Lab Test":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.117'
valueset "Sodium Lab Test V":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.119'
valueset "White Blood Cells Count Lab Test":  'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.129'

code "Heart rate": '8867-4' from "LOINC" display 'Heart rate'
code "Oxygen saturation in Arterial blood by Pulse oximetry": '59408-5' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry'
code "Respiratory rate": '9279-1' from "LOINC" display 'Respiratory rate'
code "Systolic blood pressure": '8480-6' from "LOINC" display 'Systolic blood pressure'

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
  exists "Inpatient Encounters" //added "exists"

define "Inpatient Encounters":
  from
    [Encounter: "Encounter Inpatient"] InpatientEncounter,
    [Coverage: "Medicare payer"] Payer
//    [Patient] Birthdate // no need to alias Patient here, can just use "Patient" in age calculation
    where (Payer.period overlaps before InpatientEncounter.period //what is the intended timing? This phrase measns that the encounter could end after the coverage. Is that a problem? see https://cql.hl7.org/02-authorsguide.html#comparing-intervals
    			 or start of Payer.period same as start of InpatientEncounter.period) //this second timing phrase is unneeded, "overlaps before" above means "start of X <= start of Y, and start of Y <= end of X"; see https://cql.hl7.org/02-authorsguide.html#comparing-intervals
			and end of Payer.period != start of InpatientEncounter.period //coverage cannot end exactly when encounter starts. Should this be at "day" granularity? And encounter + 1 day?
//      and Global.HospitalizationWithObservationLengthofStay(InpatientEncounter) < 365
      and InpatientEncounter.period ends during "Measurement Period"
//      and Global.CalendarAgeInYearsAt(FHIRHelpers.ToDate(Patient.birthDate), start of InpatientEncounter.period) >= 65
    return InpatientEncounter

define "Results":
flatten{//flatten turns a list of lists into a single list
  // First physical exams (vital signs)
    "FirstPhysicalExam"(([Observation: "Heart rate"] O where O.effective is not null sort by effective.value), 'HR'), //Warnings for direct reference codes are not a concern. Logic will still work. Confirmed during FHIR Call 2/4/20
    "FirstPhysicalExam"(([Observation: "Systolic blood pressure"] O where O.effective is not null sort by effective.value), 'SBP'),
    "FirstPhysicalExam"(([Observation: "Respiratory rate"] O where O.effective is not null sort by effective.value), 'RR'),
    "FirstPhysicalExam"(([Observation: "Body Temperature LOINC"] O where O.effective is not null sort by effective.value), 'Temp'),
    "FirstPhysicalExam"(([Observation: "Oxygen saturation in Arterial blood by Pulse oximetry"] O where O.effective is not null sort by effective.value), 'O2Sat'),
	// Weight uses lab test timing
		"FirstPhysicalExamWithUsingLabTiming"(([Observation: "Body Weight"] O where O.effective is not null sort by effective.value), 'Weight'),
  // First lab tests
    "FirstLabTest"(([Observation: "Hematocrit lab test"] O where O.issued is not null sort by issued.value), 'Hemat'),
    "FirstLabTest"(([Observation: "White Blood Cells Count Lab Test"] O where O.issued is not null sort by issued.value), 'WBC'),
    "FirstLabTest"(([Observation: "Potassium Lab Test"] O where O.issued is not null sort by issued.value), 'Potass'),
    "FirstLabTest"(([Observation: "Sodium Lab Test V"] O where O.issued is not null sort by issued.value), 'Sodium'),
    "FirstLabTest"(([Observation: "Bicarbonate Lab Test"] O where O.issued is not null sort by issued.value), 'Bicarb'),
    "FirstLabTest"(([Observation: "Creatinine Lab Test"] O where O.issued is not null sort by issued.value), 'Creat'),
    "FirstLabTest"(([Observation: "Glucose Lab Test"] O where O.issued is not null sort by issued.value), 'Glucose')
}

define function "FirstLabTest"(LabList List<FHIR.Observation>, CCDE String)://returns List<System.String>
  "Inpatient Encounters" Encounter
  let firstlab: First(LabList Lab
		//Need to use Global."Normalize Interval" to account for different time data types, but using "in" for now
    where Lab.issued in Interval[start of Encounter.period - 1440 minutes, start of Encounter.period + 1440 minutes]//should use "1 day"? Would this cause issues during daylight time switches?
			and Lab.status in {'final', 'amended', 'preliminary'})
    //sort by issued.value)//Sort doesn't work here as intended. Sorting need to be done outside of the Encounter comparison, so it has been moved above
		//Note that when using + with string values, if either argument is null, the result will be null. To treat null as the empty string (''), use the & operator
	return '\r\n' & CCDE & ',' & Encounter.id & ',' & ToString(firstlab.value as Quantity) & ',' & ToString(firstlab.issued)//May need to account for value[x] as data types other than Quantity
	//Added " & '\r\n'" to the return to create new lines

define function "FirstPhysicalExam"(ExamList List<FHIR.Observation>, CCDE String):
  "Inpatient Encounters" Encounter
  	let firstexam: First(ExamList Exam
		where Exam.effective in Interval[start of Encounter.period - 1440 minutes, start of Encounter.period + 120 minutes]//again, "1 day" and "2 hours"? Daylight savings switch?
			and Exam.status in {'final', 'amended', 'preliminary'})
	return '\r\n' & CCDE & ',' & Encounter.id & ',' & ToString(firstexam.value as Quantity) & ',' & ToString(firstexam.effective)

define function "FirstPhysicalExamWithUsingLabTiming"(ExamList List<FHIR.Observation>, CCDE String):
  "Inpatient Encounters" Encounter
  let firstexamwithlabtiming: First(ExamList Exam
    where Exam.effective in Interval[start of Encounter.period - 1440 minutes, start of Encounter.period + 1440 minutes]//same questions again.
			and Exam.status in {'final', 'amended', 'preliminary'})
  return '\r\n' & CCDE & ',' & Encounter.id & ',' & ToString(firstexamwithlabtiming.value as Quantity) & ',' & ToString(firstexamwithlabtiming.effective)
