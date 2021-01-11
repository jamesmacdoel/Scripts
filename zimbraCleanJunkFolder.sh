#!/bin/bash

# Clean junk folder from all users in zimbra

/opt/zimbra/bin/zmprov -l gaa | while read line ; do
        echo Cleaning $line
        /opt/zimbra/bin/zmmailbox -z -m $line emptyFolder /Trash
done