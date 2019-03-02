#!/bin/bash
i=1
for syslog in syslog/*
do
    echo "$i. ${syslog##*/}"
    choose[i]=${syslog##*/}
    i=$((i + 1))
done

echo "Please choose which one you want to decrypt(in number)>>"
read this
hour=$((${choose[this]:0:1}*10))
hour=$((hour+${choose[this]:1:1}))
echo $hour
dec=$((26-hour))

echo $dec
lowcase=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
syslog=$(<syslog/"${choose[this]}")
#syslog="$syslog${choose[this]}"
#echo "$syslog"
syslog=$(echo "$syslog" | tr "${lowcase:0:26}" "${lowcase:${dec}:26}")
#echo "$syslog"

upcase=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
syslog=$(echo "$syslog" | tr "${upcase:0:26}" "${upcase:${dec}:26}")
#echo "$syslog"

#echo "$thishour"
echo "$syslog" > dec/"${choose[this]}.dec"

