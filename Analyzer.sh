#!/bin/bash

source ./Library.sh
# Wins=$(grep -c "Win" Game_Files.txt)
# echo "$Wins ""$(date)" >> Statistics.txt
# 
# while IFS= read -r line
# do
#    delimited_Line_Array=$(echo "$line" | awk -F'_' '{print $(NF-1)}')
# done < Game_Files.txt 

echo "$wins" >> ./Statistics.txt