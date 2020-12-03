library EXM108_FHIR3 version '7.4.000'

/*
Based on CMS108v7 - Venous Thromboembolism Prophylaxis
*/

/*
This example is a work in progress and should not be considered a final specification
or recommendation for guidance. This example will help guide and direct the process
of finding conventions and usage patterns that meet the needs of the various stakeholders
in the measure development community.
*/

/*
Data Types Used:

Encounter
DeviceUseStatement
DeviceRequest
MedicationAdministration
MedicationRequest
Procedure - ordinality extension
ProcedureRequest
Condition
*/

/*
Development Notes:

    Need to define “doNotPerfom” QICore extension to support “NotDone is true” expression. Suggest to the base Resource for the following profiles –

        DeviceUseStatement
        DeviceRequest
        MedicationRequest

        Add doNotPerform to DeviceUseRequest and notDone to DeviceUseStatement:
        [#20601](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=20601)
        Promote profiles to QI-Core:
        [#20610](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=20610)

    Need to define an “ordinality” extension for Procedure profile to support “Procedure.ordinality ~ "Principal" expression.

      [#20527](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=20527)

    Need to confirm the following profiles and ensure Period is a default type -

        MedicationAdministration.effective
        Procedure.performed

        Defined as DEQM profiles currently, promote to QI-Core
        [#20611](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=20611)

    Suggest defining “recordedOn“ to support the timings for “MedicationAdministration.notGiven” and “Procedure.notDone”. see the highlighted fields below.

      [#20602](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=20602)

|Profile                   |Timing used for Done |Timing used for doNotPerform |TJC comments          |
|---|---|---|---|
|DeviceUseStatement        |whenUsed             |recordedOn                   |   |
|DeviceRequest             |authoredOn           |authoredOn                   |   |
|MedicationAdministration  |effective            |effective                    | Suggest adding recordedOn for notGiven timing |
|MedicationRequest         |authoredOn           |authoredOn                   |   |
|Procedure                 |performed            |performed                    | Suggest adding recordedOn for notDone timing |
|ProcedureRequest          |authoredOn           |authoredOn                   |   |
*/

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include MATGlobalCommonFunctions_FHIR3 version '2.0.000' called Global
include VTEICU_FHIR3 version '2.4.000' called VTEICU
include SupplementalDataElements_FHIR3 version '1.0.0' called SDE

codesystem "SNOMEDCT": 'http://snomed.info/sct/731000124108'
codesystem "LOINC": 'http://loinc.org'
codesystem "RequestIntent": 'http://hl7.org/fhir/request-intent'

valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'
valueset "Race": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.836'
valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591'
valueset "Atrial Fibrillation/Flutter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.202'
valueset "Comfort Measures": 'http://cts.nlm.nih.gov/fhir/ValueSet/1.3.6.1.4.1.33895.1.3.0.45'
valueset "Direct Thrombin Inhibitor": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.205'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "General or Neuraxial Anesthesia": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.1743'
valueset "General Surgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.255'
valueset "Glycoprotein IIb/IIIa Inhibitors": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.41'
valueset "Graduated compression stockings (GCS)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.256'
valueset "Gynecological Surgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.257'
valueset "Hemorrhagic Stroke": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.212'
valueset "Hip Fracture Surgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.258'
valueset "Hip Replacement Surgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.259'
valueset "Injectable Factor Xa Inhibitor for VTE Prophylaxis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.211'
valueset "INR": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.213'
valueset "Intermittent pneumatic compression devices (IPC)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.214'
valueset "Intracranial Neurosurgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.260'
valueset "Intravenous route": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.222'
valueset "Ischemic Stroke": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.247'
valueset "Knee Replacement Surgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.261'
valueset "Low Dose Unfractionated Heparin for VTE Prophylaxis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1045.39'
valueset "Low Molecular Weight Heparin for VTE Prophylaxis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.219'
valueset "Low Risk": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.400'
valueset "Medical Reason": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.473'
valueset "Mental Health Diagnoses": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.105.12.1004'
valueset "Obstetrics": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.263'
valueset "Obstetrics VTE": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.264'
valueset "Oral Factor Xa Inhibitor for VTE Prophylaxis or VTE Treatment": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.134'
valueset "Patient Refusal": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.93'
//valueset "Principal": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.14' // Changed to use a code
valueset "Subcutaneous route": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.223'
valueset "Unfractionated Heparin": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.218'
valueset "Urological Surgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.272'
valueset "Venous foot pumps (VFP)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.230'
valueset "Venous Thromboembolism": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.279'
valueset "Warfarin": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.232'
valueset "Intensive Care Unit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.23'

code "Risk for venous thromboembolism": '72136-5' from "LOINC" display 'Risk for venous thromboembolism'
code "Principal": '63161005' from "SNOMEDCT" display 'Principal (qualifier value)'
code "Order": 'order' from "RequestIntent" display 'Order'

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

define "Denominator":
	"Initial Population"

define "ED Visit":
	["Encounter": type in "Emergency Department Visit"] EDVisit
    where EDVisit.status = 'finished'

define "Initial Population":
	"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions"

define "No VTE Prophylaxis Device Applied or Ordered":
  // NOTE: Should be using device.code, but that requires CQL 1.4
  (
     (
       (
           ["DeviceUseStatement"] DeviceUseStatement
               where DeviceUseStatement.status = 'completed'
       ) ValidDeviceUseStatement
           with [Device] Device
               such that Global.GetId(ValidDeviceUseStatement.device.reference) = Device.id
                   and (
                       Device.type in "Venous foot pumps (VFP)"
                           or Device.type in "Intermittent pneumatic compression devices (IPC)"
                           or Device.type in "Graduated compression stockings (GCS)"
                   )
     ) D
     //JR: updated to use the Global get extension
     where Global.GetExtension(D, 'doNotPerform').value is true
  )
  union ((
    ["DeviceRequest": code in "Venous foot pumps (VFP)"]
      union ["DeviceRequest": code in "Intermittent pneumatic compression devices (IPC)"]
      union ["DeviceRequest": code in "Graduated compression stockings (GCS)"]
  ) D
    where D.intent ~ ToConcept("Order")
      //JR: updated to use the Global get extension
  	  and Global.GetExtension(D, 'doNotPerform').value is true
  )

//Done
define "No VTE Prophylaxis Device Due to Medical Reason During ED Visit":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		"ED Visit" EDVisit,
		"No VTE Prophylaxis Device Applied or Ordered" NoVTEDevice
	where FHIRHelpers.ToInterval(EDVisit.period) ends 1 hour or less on or before start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
		and (singleton from NoVTEDevice.reasonCode in "Medical Reason")
		and Coalesce(NoVTEDevice.authoredOn, NoVTEDevice.recordedOn) during FHIRHelpers.ToInterval(EDVisit.period)

//Done
define "No VTE Prophylaxis Device Due to Medical Reason on Day of or Day After Admission":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		"No VTE Prophylaxis Device Applied or Ordered" NoVTEDevice
	where (singleton from NoVTEDevice.reasonCode in "Medical Reason")
		and Coalesce(NoVTEDevice.authoredOn, NoVTEDevice.recordedOn) during VTEICU."CalendarDayOfOrDayAfter"(start of FHIRHelpers.ToInterval(QualifyingEncounter.period))

//Done
define "No VTE Prophylaxis Medication Administered or Ordered":
	((["MedicationAdministration": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"]
  	union	["MedicationAdministration": medication in "Low Molecular Weight Heparin for VTE Prophylaxis"]
  	union	["MedicationAdministration": medication in "Injectable Factor Xa Inhibitor for VTE Prophylaxis"]
  	union	["MedicationAdministration": medication in "Warfarin"]
	) MedicationAdm
		where MedicationAdm.notGiven is true
	)
	union
	//JR: code is not an attribute of MedicationRequest.  Used medication instead.
	((["MedicationRequest": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"]
  	union	["MedicationRequest": medication in "Low Molecular Weight Heparin for VTE Prophylaxis"]
  	union	["MedicationRequest": medication in "Injectable Factor Xa Inhibitor for VTE Prophylaxis"]
  	union	["MedicationRequest": medication in "Warfarin"]
	) MedicationOrder
	where	MedicationOrder.intent = 'order'
    // Updated to use Global.GetExtension
		and Global.GetExtension(MedicationOrder, 'doNotPerform').value is true
	)

//Done
define "No VTE Prophylaxis Medication Due to Medical Reason During ED Visit":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		"ED Visit" EDVisit,
		"No VTE Prophylaxis Medication Administered or Ordered" NoVTEMedication
		where FHIRHelpers.ToInterval(EDVisit.period) ends 1 hour or less on or before start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
			and (singleton from NoVTEMedication.reasonCode in "Medical Reason")
			and Coalesce(NoVTEMedication.authoredOn, start of Global."Normalize Interval"(NoVTEMedication.effective)) during FHIRHelpers.ToInterval(EDVisit.period)
		return QualifyingEncounter

//Done
define "No VTE Prophylaxis Medication Due to Medical Reason on Day of or Day After Admission":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		"No VTE Prophylaxis Medication Administered or Ordered" NoVTEMedication
		where (singleton from NoVTEMedication.reasonCode in "Medical Reason")
			and Coalesce(NoVTEMedication.authoredOn, start of NoVTEMedication.effective) during VTEICU."CalendarDayOfOrDayAfter"(start of FHIRHelpers.ToInterval(QualifyingEncounter.period))
		return QualifyingEncounter

//Done
define "No VTE Prophylaxis Device Due to Medical Reason on Day of or Day After Procedure":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		["Procedure": "General or Neuraxial Anesthesia"] AnesthesiaProcedure,
		"No VTE Prophylaxis Device Applied or Ordered" NoVTEDevice
		where NoVTEDevice.reasonCode in "Medical Reason"
			and AnesthesiaProcedure.status = 'completed'
			and Global."Normalize Interval"(AnesthesiaProcedure.performed) ends 1 day after day of start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
			and  Coalesce(NoVTEDevice.authoredOn, NoVTEDevice.recordedOn) during VTEICU."CalendarDayOfOrDayAfter"(end of Global."Normalize Interval"(AnesthesiaProcedure.performed))
		return QualifyingEncounter

//Done
define "Admission Without VTE or Obstetrical Conditions":
		(Global."Inpatient Encounter" InpatientEncounter
		where not (
		    //Connectathon: still broken: temporarily removed pending HAPI FHIR server fix for maxClauseCount > 1024
            //Global.EncounterDiagnosis(InpatientEncounter).code in "Obstetrics" or
								Global.EncounterDiagnosis(InpatientEncounter).code in "Venous Thromboembolism"
								or Global.EncounterDiagnosis(InpatientEncounter).code in "Obstetrics VTE"
							)
    )
		intersect (Global."Inpatient Encounter" InpatientEncounter
				without (
          //Connectathon: still broken: temporarily removed pending HAPI FHIR server fix for maxClauseCount > 1024
              //["Condition": code in "Obstetrics"] union
						["Condition": code in "Venous Thromboembolism"]
						union ["Condition": code in "Obstetrics VTE"])	Diagnosis
				such that Diagnosis.clinicalStatus = 'active'
        		and Diagnosis.verificationStatus = 'confirmed'
						and Global."Normalize Onset"(Diagnosis.onset) during Global."Hospitalization"(InpatientEncounter)
						)

//Done
define "No VTE Prophylaxis Medication Due to Medical Reason on Day of or Day After Procedure":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		["Procedure": "General or Neuraxial Anesthesia"] AnesthesiaProcedure,
		"No VTE Prophylaxis Medication Administered or Ordered" NoVTEMedication
		where NoVTEMedication.reasonCode in "Medical Reason"
			and AnesthesiaProcedure.status = 'completed'
			and Global."Normalize Interval"(AnesthesiaProcedure.performed) ends 1 day after day of start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
			and Coalesce(NoVTEMedication.authoredOn, start of Global."Normalize Interval"(NoVTEMedication.effective)) during VTEICU."CalendarDayOfOrDayAfter"(end of Global."Normalize Interval"(AnesthesiaProcedure.performed))
		return QualifyingEncounter


//Done
define "Encounter Less Than 2 Days":
	"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
		where Global."LengthInDays"(FHIRHelpers.ToInterval(QualifyingEncounter.period))< 2


//Done
define "SCIP VTE Selected Surgery":
	(
		//Connectathon: still broken: temporarily removed pending HAPI FHIR server fix for maxClauseCount > 1024
		// ["Procedure": "General Surgery"]
		// union
    ["Procedure": "Gynecological Surgery"]
		union ["Procedure": "Hip Fracture Surgery"]
		union ["Procedure": "Hip Replacement Surgery"]
		union ["Procedure": "Intracranial Neurosurgery"]
		union ["Procedure": "Knee Replacement Surgery"]
		union ["Procedure": "Urological Surgery"] ) P
		where P.status = 'completed'


//Done
define "Intervention Comfort Measures":
	(["ProcedureRequest": "Comfort Measures"] P
		where P.intent = 'order')
		union
		(["Procedure": "Comfort Measures"] IntervetionPerformed
		  where IntervetionPerformed.status = 'completed')

//Done
define "Intervention Comfort Measures on Day of or Day After Start of Hospitalization":
	"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
		with "Intervention Comfort Measures" ComfortMeasure
			such that Coalesce(ComfortMeasure.authoredOn, start of Global."Normalize Interval"(ComfortMeasure.performed)) 1 day or less on or after day of start of Global."Hospitalization"(QualifyingEncounter)

//Done
define "Intervention Comfort Measures on Day of or Day After Procedure":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		["Procedure": "General or Neuraxial Anesthesia"] AnesthesiaProcedure,
		"Intervention Comfort Measures" ComfortMeasure
	where  AnesthesiaProcedure.status = 'completed'
		and Global."Normalize Interval"(AnesthesiaProcedure.performed) ends 1 day after day of start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
		and Coalesce(ComfortMeasure.authoredOn, start of Global."Normalize Interval"(ComfortMeasure.performed)) 1 day or less on or after day of end of Global."Normalize Interval"(AnesthesiaProcedure.performed)

//Done
define "VTE Prophylaxis by Medication Administered or Device Applied":
	( ["MedicationAdministration": medication in "Low Dose Unfractionated Heparin for VTE Prophylaxis"] VTEMedication
			where VTEMedication.status = 'completed'
				and VTEMedication.dosage.route in "Subcutaneous route"
      return start of VTEMedication.effective
	)
		//JR: code is not an attribute of MedicationAdministration.  Used medication instead.
		union (["MedicationAdministration": medication in "Low Molecular Weight Heparin for VTE Prophylaxis"] VTEMedication return start of VTEMedication.effective)
		union (["MedicationAdministration": medication in "Injectable Factor Xa Inhibitor for VTE Prophylaxis"] VTEMedication return start of VTEMedication.effective)
		union (["MedicationAdministration": medication in "Warfarin"] VTEMedication return start of VTEMedication.effective)
		union (
      (["DeviceUseStatement"] DeviceUseStatement
        where DeviceUseStatement.status = 'completed'
      ) ValidDeviceUseStatement
        with [Device] Device
          such that Last(Split(ValidDeviceUseStatement.device.reference, '/')) = Device.id
            and (Device.type in "Venous foot pumps (VFP)"
              or Device.type in "Intermittent pneumatic compression devices (IPC)"
              or Device.type in "Graduated compression stockings (GCS)"
            )
    ) DeviceApplied
      where DeviceApplied.status = 'completed'
      return Coalesce(DeviceApplied.recordedOn, start of DeviceApplied.whenUsed)

//Done
define "VTE Prophylaxis Received on Day of or Day After Admission or Procedure":
	( from
			"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
			"VTE Prophylaxis by Medication Administered or Device Applied" VTEProphylaxisDate
    where VTEProphylaxisDate during VTEICU."CalendarDayOfOrDayAfter"(start of FHIRHelpers.ToInterval(QualifyingEncounter.period))
    return QualifyingEncounter
	)
		union ( from
				"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
				["Procedure": "General or Neuraxial Anesthesia"] AnesthesiaProcedure,
				"VTE Prophylaxis by Medication Administered or Device Applied" VTEProphylaxisDate
      where AnesthesiaProcedure.performed ends 1 day after day of start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
        and VTEProphylaxisDate during VTEICU."CalendarDayOfOrDayAfter"(end of AnesthesiaProcedure.performed)
      return QualifyingEncounter
		)

//Done
define "Medication Oral Factor Xa Inhibitor Administered on Day of or Day After Admission or Procedure":
	( from
			"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
			["MedicationAdministration": medication in "Oral Factor Xa Inhibitor for VTE Prophylaxis or VTE Treatment"] FactorXaMedication
		where Global."Normalize Interval"(FactorXaMedication.effective) starts during VTEICU."CalendarDayOfOrDayAfter"(start of FHIRHelpers.ToInterval(QualifyingEncounter.period))
		return QualifyingEncounter
	)
		union (
      from
				"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
				["Procedure": "General or Neuraxial Anesthesia"] AnesthesiaProcedure,
				["MedicationAdministration": medication in "Oral Factor Xa Inhibitor for VTE Prophylaxis or VTE Treatment"] FactorXaMedication
			where AnesthesiaProcedure.status = 'completed'
			  and Global."Normalize Interval"(AnesthesiaProcedure.performed) ends 1 day after day of start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
				and Global."Normalize Interval"(FactorXaMedication.effective) starts during VTEICU."CalendarDayOfOrDayAfter"(end of Global."Normalize Interval"(AnesthesiaProcedure.performed))
			return QualifyingEncounter
		)

//Done
define "Encounter With Prior or Present Diagnosis of Atrial Fibrillation or VTE":
	( "Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
			with ["Condition": code in "Atrial Fibrillation/Flutter"] AtrialFibrillation
				such that AtrialFibrillation.clinicalStatus = 'active'
  				and AtrialFibrillation.verificationStatus = 'confirmed'
  				and Global."Normalize Onset"(AtrialFibrillation.onset) on or before end of FHIRHelpers.ToInterval(QualifyingEncounter.period)
	)
		union ( "Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
				where Global.EncounterDiagnosis(QualifyingEncounter).code in "Atrial Fibrillation/Flutter"
			)
		union ( "Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
				with ["Condition": code in "Venous Thromboembolism"] VTEDiagnosis
					such that VTEDiagnosis.clinicalStatus in { 'inactive', 'remission', 'resolved' }
  					and VTEDiagnosis.verificationStatus = 'confirmed'
  					and Global."Normalize Onset"(VTEDiagnosis.onset) before start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
		)

//Done
define "Encounter With ICU Location Stay 1 Day or More":
	"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
		where exists (
      QualifyingEncounter.location Location
  			where Global.GetLocation(Location.location).type in "Intensive Care Unit"
  				and Global."LengthInDays"(Location.period)>= 1
  				and Location.period starts during VTEICU."CalendarDayOfOrDayAfter"(start of FHIRHelpers.ToInterval(QualifyingEncounter.period))
		)

//Done
define "Encounter With Principal Diagnosis of Mental Disorder or Stroke":
	"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
		where
      //Connectathon: still broken: temporarily removed pending HAPI FHIR server fix for maxClauseCount > 1024
      //Global.PrincipalDiagnosis(QualifyingEncounter).code in "Mental Health Diagnoses"
      //or
      Global.PrincipalDiagnosis(QualifyingEncounter).code in "Hemorrhagic Stroke"
			or Global.PrincipalDiagnosis(QualifyingEncounter).code in "Ischemic Stroke"

//Done
// TODO: Define an ordinality extension to a Procedure profile and ask Patient Administration and/or Patient Care to review
define "Encounter With Principal Procedure of SCIP VTE Selected Surgery":
	"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
		//Connectathon: pending cql_engine fix #262 (FHIR 3.0.0 model info issue with Extension.url)
		with ( "SCIP VTE Selected Surgery" Procedure
      // TODO: Validate that this is the correct way to indicate principal procedure
			where Global.GetExtension(Procedure, 'ordinality').value ~ "Principal" ) SelectedProcedure
			such that Global."Normalize Interval"(SelectedProcedure.performed) during FHIRHelpers.ToInterval(QualifyingEncounter.period)

//Done
define "Denominator Exclusions":
	"Encounter Less Than 2 Days"
		union "Encounter With ICU Location Stay 1 Day or More"
		union "Encounter With Principal Diagnosis of Mental Disorder or Stroke"
		union "Encounter With Principal Procedure of SCIP VTE Selected Surgery"
		union "Intervention Comfort Measures on Day of or Day After Start of Hospitalization"
		union "Intervention Comfort Measures on Day of or Day After Procedure"

//Done
define "Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions":
	( Global."Inpatient Encounter" InpatientEncounter
			with ["Patient"] BirthDate
				such that Global."CalendarAgeInYearsAt"(ToDateTime(BirthDate.birthDate), start of FHIRHelpers.ToInterval(InpatientEncounter.period)) >= 18
	)
		intersect "Admission Without VTE or Obstetrical Conditions"

//Done
define "Encounter With Prior or Present Procedure of Hip or Knee Replacement Surgery":
	"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
		with ( ["Procedure": "Hip Replacement Surgery"]
			union ["Procedure": "Knee Replacement Surgery"] ) HipKneeProcedure
			such that HipKneeProcedure.status = 'completed'
				and Global."Normalize Interval"(HipKneeProcedure.performed) starts on or before end of FHIRHelpers.ToInterval(QualifyingEncounter.period)

//Done
define "Low Risk for VTE or Anticoagulant Administered":
	"Low Risk for VTE or Anticoagulant Administered During ED Visit"
		union "Low Risk for VTE or Anticoagulant Administered on Day of or Day After Admission"
		union "Low Risk for VTE or Anticoagulant Administered on Day of or Day After Procedure"

//Done
define "No VTE Prophylaxis Due to Medical Reason":
	( "No VTE Prophylaxis Medication Due to Medical Reason During ED Visit"
			intersect "No VTE Prophylaxis Device Due to Medical Reason During ED Visit"
	)
		union ( "No VTE Prophylaxis Medication Due to Medical Reason on Day of or Day After Admission"
				intersect "No VTE Prophylaxis Device Due to Medical Reason on Day of or Day After Admission"
		)
		union ( "No VTE Prophylaxis Medication Due to Medical Reason on Day of or Day After Procedure"
				intersect "No VTE Prophylaxis Device Due to Medical Reason on Day of or Day After Procedure"
		)

//Done
define "No VTE Prophylaxis Due to Patient Refusal During ED Visit":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		"ED Visit" EDVisit,
		"No VTE Prophylaxis Medication or Device Due to Patient Refusal" PatientRefusal
	where EDVisit.period ends 1 hour or less on or before start of QualifyingEncounter.period
		and Coalesce(PatientRefusal.effective, PatientRefusal.authoredOn, PatientRefusal.recordedOn) during EDVisit.period
	return QualifyingEncounter

//Done
define "No VTE Prophylaxis Due to Patient Refusal on Day of or Day After Admission":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		"No VTE Prophylaxis Medication or Device Due to Patient Refusal" PatientRefusal
	where Coalesce(start of PatientRefusal.effective, PatientRefusal.authoredOn, PatientRefusal.recordedOn)
    during VTEICU."CalendarDayOfOrDayAfter"(start of QualifyingEncounter.period)
	return QualifyingEncounter

//Done
define "No VTE Prophylaxis Due to Patient Refusal on Day of or Day After Procedure":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		["Procedure": "General or Neuraxial Anesthesia"] AnesthesiaProcedure,
		"No VTE Prophylaxis Medication or Device Due to Patient Refusal" PatientRefusal
	where Global."Normalize Interval"(AnesthesiaProcedure.performed) ends 1 day after day of start of QualifyingEncounter.period
		and Coalesce(start of PatientRefusal.effective, PatientRefusal.authoredOn, PatientRefusal.recordedOn)
      during VTEICU."CalendarDayOfOrDayAfter"(end of AnesthesiaProcedure.performed)
	return QualifyingEncounter

//Done
define "No VTE Prophylaxis Medication or Device Due to Patient Refusal":
	( "No VTE Prophylaxis Medication Administered or Ordered"
		union "No VTE Prophylaxis Device Applied or Ordered" ) NoVTEProphylaxis
		where Global.GetExtension(NoVTEProphylaxis, 'notDoneReason').value in "Patient Refusal"

//Done
define "No VTE Prophylaxis Due to Patient Refusal":
	"No VTE Prophylaxis Due to Patient Refusal During ED Visit"
		union "No VTE Prophylaxis Due to Patient Refusal on Day of or Day After Admission"
		union "No VTE Prophylaxis Due to Patient Refusal on Day of or Day After Procedure"

//Done
define "Numerator":
	"VTE Prophylaxis Received on Day of or Day After Admission or Procedure"
		union ( "Medication Oral Factor Xa Inhibitor Administered on Day of or Day After Admission or Procedure"
				intersect ( "Encounter With Prior or Present Diagnosis of Atrial Fibrillation or VTE"
						union "Encounter With Prior or Present Procedure of Hip or Knee Replacement Surgery"
				)
		)
		union "Low Risk for VTE or Anticoagulant Administered"
		union "No VTE Prophylaxis Due to Medical Reason"
		union "No VTE Prophylaxis Due to Patient Refusal"

//Done
define "Is In Low Risk for VTE or On Anticoagulant":
    //Connectathon: verified that this is corrected
	( ["Observation": "Risk for venous thromboembolism"] VTERiskAssessment
			where VTERiskAssessment.value in "Low Risk"
	)

/*
// TODO: Issues with constructing the FHIR types here...
		union ( ["Observation": "INR"] INRLabTest
				where INRLabTest.value as Quantity > 3.0
				return "Observation" { id: INRLabTest.id, effective: INRLabTest.issued }
		)
		union ((( ["MedicationAdministration": "Unfractionated Heparin"] UnfractionatedHeparin
					where UnfractionatedHeparin.dosage.route in "Intravenous route"
						)
				union ["MedicationAdministration": "Direct Thrombin Inhibitor"]
				union ["MedicationAdministration": "Glycoprotein IIb/IIIa Inhibitors"] ) AnticoagulantMedication
					return "Observation" { id: AnticoagulantMedication.id, effective: start of effective}
		)
*/

//Done
define "Low Risk for VTE or Anticoagulant Administered During ED Visit":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		"ED Visit" EDVisit,
		"Is In Low Risk for VTE or On Anticoagulant" VTERiskAssessment
	where FHIRHelpers.ToInterval(EDVisit.period) ends 1 hour or less on or before start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
		and VTERiskAssessment.issued during FHIRHelpers.ToInterval(EDVisit.period)
	return QualifyingEncounter

//Done
define "Low Risk for VTE or Anticoagulant Administered on Day of or Day After Admission":
	"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter
		with "Is In Low Risk for VTE or On Anticoagulant" VTERiskAssessment
			such that VTERiskAssessment.issued during VTEICU."CalendarDayOfOrDayAfter"(start of FHIRHelpers.ToInterval(QualifyingEncounter.period))

//Done
define "Low Risk for VTE or Anticoagulant Administered on Day of or Day After Procedure":
	from
		"Encounter With Age Range and Without VTE Diagnosis or Obstetrical Conditions" QualifyingEncounter,
		["Procedure": "General or Neuraxial Anesthesia"] AnesthesiaProcedure,
		"Is In Low Risk for VTE or On Anticoagulant" VTERiskAssessment
	where Global."Normalize Interval"(AnesthesiaProcedure.performed) ends 1 day after day of start of FHIRHelpers.ToInterval(QualifyingEncounter.period)
		and VTERiskAssessment.issued during VTEICU."CalendarDayOfOrDayAfter"(end of Global."Normalize Interval"(AnesthesiaProcedure.performed))
	return QualifyingEncounter
