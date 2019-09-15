 CQL_DIR=".."
 LIBRARY_DIR="../resources"
 MAP=(

     # STU3
        "cql/fhir3/FHIRHelpers-3.0.0.cql:fhir3/library/FHIRHelpers.json"
        "cql/fhir3/AdultOutpatientEncounters_FHIR3-1.1.000.cql:fhir3/library/AdultOutpatientEncounters_FHIR3.json"
        "cql/fhir3/AdvancedIllnessandFrailtyExclusion_FHIR3.cql:fhir3/library/AdvancedIllnessandFrailtyExclusion_FHIR3.json" 
        "cql/fhir3/EXM104_FHIR3-8.1.000.cql:fhir3/library/EXM104_FHIR3.json" 
        "cql/fhir3/EXM108_FHIR3-7.4.000.cql:fhir3/library/EXM108_FHIR3.json" 
        "cql/fhir3/EXM124_FHIR3-7.2.000.cql:fhir3/library/EXM124_FHIR3.json" 
        "cql/fhir3/EXM125_FHIR3-7.2.000.cql:fhir3/library/EXM125_FHIR3.json" 
        "cql/fhir3/EXM130_FHIR3-7.2.000.cql:fhir3/library/EXM130_FHIR3.json" 
        "cql/fhir3/EXM165_FHIR3-8.5.000.cql:fhir3/library/EXM165_FHIR3.json" 
        "cql/fhir3/Hospice_FHIR3-1.0.000.cql:fhir3/library/Hospice_FHIR3.json" 
        "cql/fhir3/MATGlobalCommonFunctions_FHIR3-2.0.000.cql:fhir3/library/MATGlobalCommonFunctions_FHIR3.json" 
        "cql/fhir3/SupplementalDataElements_FHIR3-1.0.0.cql:fhir3/library/SupplementalDataElements_FHIR3.json" 
        "cql/fhir3/TJC_Overall_FHIR3-3.6.000.cql:fhir3/library/TJC_Overall_FHIR3.json" 
        "cql/fhir3/VTEICU_FHIR3-2.4.000.cql:fhir3/library/VTEICU_FHIR3.json" 

    # R4
        "cql/fhir4/AdultOutpatientEncounters_FHIR4-1.1.000.cql:fhir4/library/AdultOutpatientEncounters_FHIR4.json" 
        #"cql/fhir4/AdvancedIllnessandFrailtyExclusion_FHIR4-4.0.000.cql:fhir4/library/AdvancedIllnessandFrailtyExclusion_FHIR4.json" 
        "cql/fhir4/EXM124_FHIR4-7.2.000.cql:fhir4/library/EXM124_FHIR4.json" 
        "cql/fhir4/EXM125_FHIR4-7.2.000.cql:fhir4/library/EXM125_FHIR4.json" 
        "cql/fhir4/EXM130_FHIR4-7.2.000.cql:fhir4/library/EXM130_FHIR4.json" 
        #"cql/fhir4/EXM165_FHIR4-8.5.000.cql:fhir4/library/EXM165_FHIR4.json" 
        "cql/fhir4/FHIRHelpers-4.0.0.cql:fhir4/library/FHIRHelpers.json" 
        "cql/fhir4/Hospice_FHIR4-1.0.000.cql:fhir4/library/Hospice_FHIR4.json" 
        "cql/fhir4/MATGlobalCommonFunctions_FHIR4-4.0.000.cql:fhir4/library/MATGlobalCommonFunctions_FHIR4.json" 
        "cql/fhir4/SupplementalDataElements_FHIR4-1.0.0.cql:fhir4/library/SupplementalDataElements_FHIR4.json" 
        #"cql/fhir4/TJC_Overall_FHIR4-4.0.000.cql:fhir4/library/TJC_Overall_FHIR4.json" 

    )

for item in "${MAP[@]}" ; do
    CQL_FILE=${item%%:*}
    LIBRARY_FILE=${item#*:}
    echo "updating $CQL_FILE in $LIBRARY_FILE library"
    java -jar tooling-1.0-SNAPSHOT-jar-with-dependencies.jar -UpdateCql -ptl=$CQL_DIR/$CQL_FILE -ptlr=$LIBRARY_DIR/$LIBRARY_FILE
    #mvn exec:java -Dexec.args="-UpdateCql -ptl=$CQL_DIR/$CQL_FILE -ptlr=$LIBRARY_DIR/$LIBRARY_FILE"
done

