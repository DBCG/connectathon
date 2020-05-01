#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-1.1.0-SNAPSHOT-jar-with-dependencies.jar
input_cache_path=./input-cache
ig_resource_path=$PWD/input/connectathon.xml
measure_to_refresh_path=$PWD/input/resources/measure/measure-EXM104_FHIR4-8.1.000.json

set -e
echo Checking internet connection...
wget -q --spider tx.fhir.org

if [ $? -eq 0 ]; then
	echo "Online"
	fsoption="-fs http://cqm-sandbox.alphora.com/cqf-ruler-r4/fhir/"
else
	echo "Offline"
	fsoption=""
fi

echo "$fsoption"
echo "ig_resource_path:" "$ig_resource_path"

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	#JAVA -jar $tooling -RefreshIG -ip="$PWD" -igrp="$ig_resource_path" -iv=fhir4 -t -d -p -v $fsoption
	JAVA -jar $tooling -RefreshIG -ip="$PWD" -igrp="$ig_resource_path" -mtrp="$measure_to_refresh_path" -iv=fhir4 -t -d -p -v $fsoption
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		#JAVA -jar $tooling -RefreshIG -ip=C%~dp0 -igrp="$ig_resource_path" -iv=fhir4 -t -d -p -v $fsoption
		JAVA -jar $tooling -RefreshIG -ip=C%~dp0 -igrp="$ig_resource_path" -mtrp="$measure_to_refresh_path" -iv=fhir4 -t -d -p -v $fsoption
	else
		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateRefreshIG.  Aborting...
	fi
fi
