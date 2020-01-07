#!/bin/bash
#echo Downloading the CQF Tooling jar is currently not an option. Get the jar from Bryn.
#exit 1

dlurl=https://oss.sonatype.org/service/local/repositories/snapshots/content/org/opencds/cqf/tooling/1.0-SNAPSHOT/tooling-1.0-20200107.000442-2-jar-with-dependencies.jar
tooling_jar=tooling-1.0-SNAPSHOT-jar-with-dependencies.jar
input_cache_path=./input-cache/

set -e
if ! type "curl" > /dev/null; then
	echo "ERROR: Script needs curl to download latest IG Tooling. Please install curl."
	exit 1
fi

tooling="$input_cache_path$tooling_jar"
if test -f "$tooling"; then
	echo "IG Tooling FOUND in input-cache"
	jarlocation="$tooling"
	jarlocationname="Input Cache"
	upgrade=true
else
	tooling="../$tooling_jar"
	upgrade=true
	if test -f "$tooling"; then
		echo "IG Tooling FOUND in parent folder"
		jarlocation="$tooling"
		jarlocationname="Parent Folder"
		upgrade=true
	else
		echo IG Tooling NOT FOUND in input-cache or parent folder...
		jarlocation="$input_cache_path$tooling_jar"
		jarlocationname="Input Cache"
		upgrade=false
	fi
fi

if $upgrade ; then
	message="Overwrite $jarlocation? [Y/N] "
else
	#echo Will place tooling jar here: $input_cache_path$tooling_jar
	echo Will place tooling jar here: $jarlocation
	message="Ok? [Y/N]"
fi

read -r -p "$message" response
if [[ "$response" =~ ^([yY])$ ]]; then
	echo "Downloading most recent tooling to $jarlocationname - it's ~70 MB, so this may take a bit"
#	wget "https://oss.sonatype.org/service/local/repositories/snapshots/content/org/opencds/cqf/tooling/1.0-SNAPSHOT/tooling-1.0-20200107.000442-2-jar-with-dependencies.jar" -O "$jarlocation"
	curl $dlurl -o "$jarlocation" --create-dirs
else
	echo cancel...
fi
