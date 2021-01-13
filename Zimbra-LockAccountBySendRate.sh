#!/bin/bash

RATE=`/opt/zimbra/libexec/zmmsgtrace -s "@foo.com" 2> /dev/nul |grep "foo.com \-\->" |sort |uniq -c`
RATE=`echo $RATE |sed -e 's/ --> /,/g'`

OLDIFS=$IFS
IFS=','
aRATE=($RATE)

for line in "${aRATE[@]}" ;do
        COUNT=`echo $line |awk '{print $1}'`
        EMAIL=`echo $line |awk '{print $2}'`

        #echo $line
        #echo $COUNT
        #echo $EMAIL

        if [ ${COUNT:-0} -gt 1500 ]; then
                echo lock account $EMAIL
                /opt/zimbra/bin/zmprov ma $EMAIL zimbraAccountStatus lock
        fi
done
IFS=$OLDIFS
