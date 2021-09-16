#!/bin/bash

str=$1

if [[ -z $1 || -z $2 || -z $3 ]]; then
	exit;
fi
ISTR=$1
OSTR="${1//$2/$3}"
echo $OSTR

FILES=($(grep -rnw "." -e "$1" | awk -F':' '{print $1 }' | awk {'printf " " $0} END {print " "'}))
echo ${FILES[@]}

for file in ${FILES[@]}
do
	echo $file
	ISTR=${ISTR//\//\/}
	OSTR=${OSTR//\//\/}
	echo $OSTR
	sed -i "s~$1~$OSTR~g" $file
done
