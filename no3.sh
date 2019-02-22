
#NOMOR 3


#!/bin/bash

loop=1
ke=1



while [ $loop -ne 0 ]
do

if [[ -f /home/awin/praktikum1/password$ke.txt ]] ; then

    ke=$((ke + 1))

else

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/awin/praktikum1/password$ke.txt
loop=0

fi



done
