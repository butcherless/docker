#!/bin/bash

FIND_PATH=`pwd`
MF_DIR="META-INF"
MF_NAME="MANIFEST.MF"

cd /tmp

for i in $(find $FIND_PATH -type f -name "*.jar")
do
 SHASUM=`sha1sum $i`
 MF_COUNT=`jar tvf $i | grep -c $MF_NAME`

echo -e "file: $SHASUM ($MF_COUNT)"
if [ $MF_COUNT -gt 0 ]; then
	BASENAME=`basename $i`
	cp $i .
#	jar xf $i $MF_DIR/$MF_NAME
	jar xf $BASENAME $MF_DIR/$MF_NAME

	cat $MF_DIR/$MF_NAME
	rm -f $BASENAME
fi

done

cd -