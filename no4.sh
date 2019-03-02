#!/bin/bash

hour=$(date +"%H")

if [[ ${hour:0:1} -eq 0 ]]
then
    hour=${hour:1:1}
fi

#echo $hour

lowcase=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
syslog=$(</var/log/syslog)
#echo "$syslog"
syslog=$(echo "$syslog" | tr "${lowcase:0:26}" "${lowcase:${hour}:26}")
#echo "$syslog"

upcase=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
syslog=$(echo "$syslog" | tr "${upcase:0:26}" "${upcase:${hour}:26}")
#echo "$syslog"

thishour=$(date +"%H:%M %d-%m-%Y")
#echo "$thishour"

echo "$syslog" > syslog/"$thishour"

