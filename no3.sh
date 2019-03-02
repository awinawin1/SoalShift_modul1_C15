#!/bin/bash

uuid=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)

# echo $uuid

file="password"
ext=".txt"

counter=1
flag=1

for passtxt in password/password*.txt
do
    path="password/password$counter.txt"
    #echo "${passtxt:17:1}"
    if [[ "*" == ${passtxt:17:1} ]]
    then
        echo "Still empty, so create new file password$counter.txt"
        echo "$uuid" > $path
        flag=0
        break
    elif [[ counter -ne ${passtxt:17:1} ]]
    then
        echo "password$counter.txt not available, create new file"
        echo "$uuid" > $path
        flag=0
        break
    else
        echo "password$counter.txt available"
    fi
  counter=$((counter + 1))
done

if [[ flag -eq 1 ]]
then
    path="password/password$counter.txt"
    echo "password$counter.txt not available, create new file"
    echo "$uuid" > $path
fi


