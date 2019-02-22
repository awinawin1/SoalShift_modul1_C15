#!/bin/bash

echo "---(A)---"

#(a)
awk -F ',' '{if($7 == '2012') iter[$1]+=$10} END {for(hasil in iter) {print hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1

echo "---(B)---"

#(b)
awk -F ',' '{if($7 == '2012' && $1 == "United States") p[$4]+=$10} END {for(hasil in p) {print p[hasil],hasil}}' WA_Sales_Products_2012-14.cs$

echo "---(C)---"

#(c)
echo "Personal Accessories"
awk -F ',' '{if($4 == "Personal Accessories" && $1 == "United States") p[$6]+=$10} END {for(hasil in p) {print p[hasil],hasil}}' WA_Sales_Pro$
echo "Camping Equipment"
awk -F ',' '{if($4 == "Camping Equipment" && $1 == "United States") p[$6]+=$10} END {for(hasil in p) {print p[hasil],hasil}}' WA_Sales_Produc$
echo "Mountaineering Equipment"
awk -F ',' '{if($4 == "Mountaineering Equipment" && $1 == "United States") p[$6]+=$10} END {for(hasil in p) {print p[hasil],hasil}}' WA_Sales$
