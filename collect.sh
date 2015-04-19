#!/bin/bash

FILES=`ls /etc/libvirt/qemu/*.xml`
for FILE in $FILES
do
	NAME=`grep -oh "<name>.*</name>" $FILE | sed 's/\(<name>\|<\/name>\)//g'`
	CURRENTMEMORY=`grep -oh "<currentMemory>.*</currentMemory>" $FILE | sed 's/\(<currentMemory>\|<\/currentMemory>\)//g'`
	#echo "$NAME"
	echo "$CURRENTMEMORY"
done
