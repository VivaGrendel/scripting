#!/bin/bash

SRC_DIR="."

[ "$1" = "" ] || SRC_DIR=$1

echo "Scanning following directory ..."
echo ${SRC_DIR}

SRC_DIR_LENGTH=`expr ${#SRC_DIR} + 1`

echo ${SRC_DIR_LENGTH}

find "${SRC_DIR}" -type d -name '*' ! -name '.*' | while read fn; do
	FN=`echo ${fn:${SRC_DIR_LENGTH}} | sed 's/\// - /g' | sed 's/ /_/g'`

	FILES=`find "${fn}" -maxdepth 1 -type f -name '*' ! -name '.*'`
#	echo ${#FILES}
#	find "${fn}" -maxdepth 1 -type f -name '*' ! -name '.*'

	if [ "${FN}" != "" ] && [ "${#FILES}" -gt 0 ]
	then
		# GET FILENAME
		echo "PLAYLIST FILE TO CREATE: "${FN}
		rm "${fn}/${FN}.m3u"
#		ls "${fn}" > "${fn}/${FN}.m3u"
		ls "${fn}" | grep -vi "m3u" > "${fn}/${FN}.m3u"
		
	fi
done

#find "${SRC_DIR}" -name "*.m3u" -exec cat {} \;

exit 0