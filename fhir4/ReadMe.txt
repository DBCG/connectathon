The issue is that "test retrieve" and "test qeury" don't behave the same in the Ruler (they do in Atom): develop - Revision: 7e32cab3

Example results from Atom and the Ruler are in the results folder.

To repro, run this using the IGRefresh tooling with the following config:


        {
            "type": "java",
            "name": "Connectathon FHIR4",
            "request": "launch",
            "mainClass": "org.opencds.cqf.Main",
            "projectName": "tooling",
            "args": [
                "-RefreshIG",
                "-ip=/src/connectathon/fhir4",
                "-fs=http://localhost:8080/cqf-ruler-r4/fhir/",
                "-t",
                "-d",
                "-p",
                "-v"
            ]
        }

Or just post the bundle at: \fhir4\bundles\EXM108_FHIR4-8.2.000

Then run: http://localhost:8080/cqf-ruler-r4/fhir/$cql

With:

{
    "resourceType": "Parameters",
    "parameter": [
    	{
    		"name": "code",
    		"valueString": "library EXM108_FHIR4 version '8.2.000'\r\n\r\nusing FHIR version '4.0.0'\r\n\r\ninclude FHIRHelpers version '4.0.0' called FHIRHelpers\r\n\r\nvalueset \"Low Molecular Weight Heparin for VTE Prophylaxis\": 'http:\/\/cts.nlm.nih.gov\/fhir\/ValueSet\/2.16.840.1.113883.3.117.1.7.1.219'\r\n\r\nparameter \"Measurement Period\" Interval<DateTime>\r\n  default Interval[@2019-01-01T00:00:00.0, @2020-01-01T00:00:00.0)\r\n\r\ncontext Patient\r\n\r\ndefine \"test retrieve\":\r\n  [\"MedicationAdministration\": medication in \"Low Molecular Weight Heparin for VTE Prophylaxis\"] WMA\r\n    where WMA.status = 'completed'\r\n\r\ndefine \"test query\":\r\n  [\"MedicationAdministration\"] MA\r\n    where MA.status = 'completed'\r\n    and MA.medication in \"Low Molecular Weight Heparin for VTE Prophylaxis\""
    	},
    	{
    		"name": "patientId",
    		"valueString": "denom-EXM108-FHIR4"
    	},
    	{
    		"name": "periodStart",
    		"valueString": "2019-01-01"
    	},
    	{
    		"name": "periodEnd",
    		"valueString": "2019-12-31"
    	},
    	{
    		"name": "context",
    		"valueString": "context"
    	}
    ]
}
