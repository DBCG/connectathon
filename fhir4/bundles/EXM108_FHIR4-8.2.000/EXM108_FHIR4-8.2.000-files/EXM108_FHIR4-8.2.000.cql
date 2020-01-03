library EXM108_FHIR4 version '8.2.000'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

valueset "Low Molecular Weight Heparin for VTE Prophylaxis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.219'

parameter "Measurement Period" Interval<DateTime>
  default Interval[@2019-01-01T00:00:00.0, @2020-01-01T00:00:00.0)

context Patient

define "test retrieve":
  ["MedicationAdministration": medication in "Low Molecular Weight Heparin for VTE Prophylaxis"] WMA
    where WMA.status = 'completed'

define "test query":
  ["MedicationAdministration"] MA
    where MA.status = 'completed'
    and MA.medication in "Low Molecular Weight Heparin for VTE Prophylaxis"
