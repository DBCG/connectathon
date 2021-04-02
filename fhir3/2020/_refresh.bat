@ECHO OFF
SET tooling_jar=tooling-1.3.1-SNAPSHOT-jar-with-dependencies.jar
SET input_cache_path=%~dp0input-cache
SET ig_resource_path=%~dp0input/connectathon.xml
rem measure_to_refresh_path=%~dp0/input/resources/Measure/EXM104_FHIR3-8.1.000.json

ECHO Checking internet connection...
PING tx.fhir.org -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
ECHO We're offline...
SET fsoption=
GOTO igpublish

:isonline
ECHO We're online, setting publish to the Connectathon sandbox FHIR server
SET fsoption=-fs http://localhost:8080/cqf-ruler-dstu3/fhir/

:igpublish

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%tooling_jar%" (
	ECHO running: JAVA -jar "%input_cache_path%\%tooling_jar%" -RefreshIG -ini=%~dp0ig.ini -t -d -p -v
        JAVA -jar "%input_cache_path%\%tooling_jar%" -RefreshIG -ini=%~dp0ig.ini -t -d -p -v %fsoption%
        rem JAVA -jar "%input_cache_path%\%tooling_jar%" -RefreshIG -ini=%~dp0ig.ini -mtrp="%measure_to_refresh_path%" -t -d -p -v %fsoption%
) ELSE If exist "..\%tooling_jar%" (
        ECHO running: JAVA -jar "..\%tooling_jar%" -RefreshIG -ini=%~dp0ig.ini -t -d -p -v
        JAVA -jar "..\%tooling_jar%" -RefreshIG -ini=%~dp0\ig.ini -t -d -p -v %fsoption%
        rem JAVA -jar "%input_cache_path%\%tooling_jar%" -RefreshIG -ini=%~dp0ig.ini -mtrp="%measure_to_refresh_path%" -t -d -p -v %fsoption%
) ELSE (
        ECHO IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateRefreshIG.  Aborting...
)


PAUSE
