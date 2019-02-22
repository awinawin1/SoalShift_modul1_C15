#!/bin/bash

unzip /home/awin/praktikum1/nature.zip -d /home/awin/praktikum1
mkdir /home/awin/praktikum1/nature/hasil
iter = 0

for pict in /home/awin/praktikum1/nature/*.jpg

do

base64 -d $pict | xxd -r > /home/awin/praktikum1/nature/hasil/$iter.jpg
iter=$((iter+1))
done
