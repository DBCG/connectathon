library SupplementalDataElements_FHIR2 version '1.0.0'

using FHIR version '1.0.2'

include FHIRHelpers version '1.0.2' called FHIRHelpers

valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'
valueset "Race": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.836'
valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591'

context Patient

define "SDE Ethnicity":
  (flatten (
    Patient.extension Extension
      where Extension.url = 'http://fhir.org/guides/argonaut/StructureDefinition/argo-ethnicity'
        return Extension.extension
  )) E
    where E.url = 'ombCategory'
      or E.url = 'detailed'
    return E.valueCodeableConcept
    
define "SDE Payer":
    [Coverage: type in "Payer"] Payer
      return {
        code: Payer.type,
        period: Payer.period
      }
      
define "SDE Race":
  (flatten (
    Patient.extension Extension
      where Extension.url = 'http://fhir.org/guides/argonaut/StructureDefinition/argo-race'
        return Extension.extension
  )) E
    where E.url = 'ombCategory'
      or E.url = 'detailed'
    return E.valueCodeableConcept

define "SDE Sex":
  case 
    when Patient.gender = 'male' then Code { code: 'M', system: 'http://hl7.org/fhir/v3/AdministrativeGender', display: 'Male' }
    when Patient.gender = 'female' then Code { code: 'F', system: 'http://hl7.org/fhir/v3/AdministrativeGender', display: 'Female' }
    else null
  end

