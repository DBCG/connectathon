@ECHO OFF
SET tooling_jar=tooling-1.0-SNAPSHOT-jar-with-dependencies.jar
SET input_cache_path=%~dp0input-cache

ECHO Checking internet connection...
PING tx.fhir.org -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
ECHO We're offline...
SET psoption=
GOTO igpublish

:isonline
ECHO We're online, setting publish to the Connectathon sandbox FHIR server
SET psoption=-fs http://cqm-sandbox.alphora.com/cqf-ruler-r4/fhir/

:igpublish

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%tooling_jar%" (
	ECHO running: JAVA -jar %input_cache_path%\%tooling_jar% -RefreshIG -ip=%~dp0 -t -d -p -v %psoption%
	JAVA -jar %input_cache_path%\%tooling_jar% -RefreshIG -ip=C:\src\connectathon\fhir3 -t -d -p -v %psoption%
) ELSE If exist "..\%tooling_jar%" (
	ECHO running: JAVA -jar ..\%tooling_jar% -RefreshIG -ip=%~dp0 -t -d -p -v %psoption%
	JAVA -jar ..\%tooling_jar% -RefreshIG -ip=%~dp0 -t -d -p -v %psoption%
) ELSE (
	ECHO IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateRefreshIG.  Aborting...
)

PAUSE

