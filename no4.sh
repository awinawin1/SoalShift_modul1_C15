#!/bin/bash

upcase=ABCDEFGHIJKLMNOPQRSTUVWXYZ
lowcase=abcdefghijklmnopqrstuvwxyz

up=($(echo ${upcase[@]})$(echo ${upcase[@]}))
low=($(echo ${lowcase[@]})$(echo ${lowcase[@]}))
hour=`date +"%H"`
rot=$hour

xx=($(echo ${upcase[@]})$(echo ${lowcase[@]}))
upp=$(echo $upercase | tr "${upcase:0:26}" "${up:${rot}:26}")
loww=$(echo $lowcase | tr "${upcase:0:26}" "${low:${rot}:26}")
xxx=($(echo ${up[@]})$(echo ${low[@]}))

file=`date +"%H:%M %d-%m-%Y"`s

< /var/log/syslog > "$file" tr "$xx" "$xxx"

