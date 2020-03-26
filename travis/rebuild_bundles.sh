#!/bin/bash

tooling_jar=./travis/tooling/tooling-1.0.4-SNAPSHOT-jar-with-dependencies.jar

java -jar $tooling_jar -RefreshIG -ip="./fhir4/" -iv=fhir4 -t -d -p -v