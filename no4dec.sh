#!/bin/bash

read new

up=ABCDEFGHIJKLMNOPQRSTUVWXYZ
low=abcdefghijklmnopqrstuvwxyz

upp=($(echo ${up[@]})$(echo ${up[@]}))
loww=($(echo ${low[@]})$(echo ${low[@]}))
hour=${new:0:2}
rot=$hour

xx=($(echo ${low[@]})$(echo ${up[@]}))
A=$(echo $upp | tr "${upp:0:26}" "${upp:${rot}:26}")
B=$(echo $loww | tr "${loww:0:26}" "${loww:${rot}:26}")
xxx=($(echo ${A[@]})$(echo ${B[@]}))

< "$new" > "$new dec" tr "$xxx" "$xx"
