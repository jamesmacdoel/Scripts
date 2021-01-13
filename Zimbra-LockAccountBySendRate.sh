#!/bin/bash

MOST=`/opt/zimbra/libexec/zmmsgtrace -s "@foo.com" 2> /dev/nul |grep "foo.com \-\->" |sort |uniq -c |sort -g |tail -n1`

COUNT=`echo $MOST |awk '{print $1}'`
EMAIL=`echo $MOST |awk '{print $2}'`

#echo $MOST
#echo $COUNT
#echo $EMAIL

if [ ${COUNT:-0} -gt 1500 ]; then
        echo lock account
        /opt/zimbra/bin/zmprov ma $EMAIL zimbraAccountStatus lock
fi