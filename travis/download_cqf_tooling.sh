#!/bin/bash

r=snapshots
g=org.opencds.cqf
a=tooling
v=1.0.4-SNAPSHOT
c=jar-with-dependencies

dlurl='https://oss.sonatype.org/service/local/artifact/maven/redirect?r='${r}'&g='${g}'&a='${a}'&v='${v}'&c='${c}''

echo ${dlurl}

jar_folder=./travis/tooling/
tooling_jar=tooling-1.0.4-SNAPSHOT-jar-with-dependencies.jar

set -e
if ! type "curl" > /dev/null; then
	echo "ERROR: Script needs curl to download latest IG Tooling. Please install curl."
	exit 1
fi

tooling_dest="$jar_folder$tooling_jar"
if test -f "$tooling_dest"; then
	echo "Tooling JAR FOUND, will not replace it"
else
  echo "Downloading most recent tooling JAR - it's ~170 MB, so this may take a bit"
  #	wget "https://oss.sonatype.org/service/local/repositories/snapshots/content/org/opencds/cqf/tooling/1.0-SNAPSHOT/tooling-1.0-20200107.163002-6-jar-with-dependencies.jar" -O "$jarlocation"
  curl $dlurl -L -o "$tooling_dest" --create-dirs
  echo "Download complete."
fi