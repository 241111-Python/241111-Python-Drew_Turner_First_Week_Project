#!/bin/bash

source ./Library.sh
Wins=$(grep -c "Win" Game_Files.txt)
echo "$Wins ""$(date)" >> Statistics.txt

while IFS= read -r line
do
    echo "$line"
done < Game_Files.txt | awk -F'_' '{print $(NF-1)}'