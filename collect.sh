#!/bin/bash

VIRSH_LOCAL="virsh --connect qemu:///system"
HOSTS=`$VIRSH_LOCAL list --name`
for HOST in $HOSTS
do
        XMLCONFIG=`$VIRSH_LOCAL dumpxml $HOST > $HOST.xml`
        MEMORY=$(xmllint --xpath '//memory/text()' $HOST.xml)
        echo "$HOST, $MEMORY"
        rm $HOST.xml
done
