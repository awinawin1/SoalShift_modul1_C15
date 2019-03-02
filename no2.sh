#!/bin/bash

echo "---(A)---"

#(a)
awk -F ',' '{if($7 == '2012') iter[$1]+=$10} END {for(hasil in iter) {print hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1

echo "---(B)---"
#(b)
awk -F ',' '{if($7 == '2012' && $1 == "United States") p[$4]+=$10} END {for(hasil in p) {print p[hasil],hasil}}' 
WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3}'

awk -F ',' '{if($7=='2012' && $1=="United States" && 
($4=="Outdoor Protection" || $4=="Camping Equipment" || $4=="Personal Accessories") ) 
 p[$6]+=$10} END {for(hasil in p) {print p[hasil]" "hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | head -3 
