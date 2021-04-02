#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-1.3.1-SNAPSHOT-jar-with-dependencies.jar
input_cache_path=./input-cache
ig_resource_path=./input/connectathon.xml
#measure_to_refresh_path=$PWD/input/resources/measure/measure-EXM104_FHIR3-8.1.000.json

set -e
echo Checking internet connection...
wget -q --spider tx.fhir.org

if [ $? -eq 0 ]; then
	echo "Online"
	fsoption="-fs http://cqm-sandbox.alphora.com/cqf-ruler-dstu3/fhir/"
else
	echo "Offline"
	fsoption=""
fi

echo "$fsoption"

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	java -jar $tooling -RefreshIG -ini="$PWD"/ig.ini -t -d -p -v # $fsoption
	#java -jar $tooling -RefreshIG -ini="$PWD"/ig.ini -mtrp="$measure_to_refresh_path" -t -d -p -v $fsoption
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
	    java -jar $tooling -RefreshIG -ini="$PWD"/ig.ini -t -d -p -v # $fsoption
	    #java -jar $tooling -RefreshIG -ini="$PWD"/ig.ini -mtrp="$measure_to_refresh_path" -t -d -p -v $fsoption
	else
		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateRefreshIG.  Aborting...
	fi
fi
