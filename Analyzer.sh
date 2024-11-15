#!/bin/bash

source ./Library.sh
# Wins=$(grep -c "Win" Game_Files.txt)
# echo "$Wins ""$(date)" >> Statistics.txt
# 
# while IFS= read -r line
# do
#    delimited_Line_Array=$(echo "$line" | awk -F'_' '{print $(NF-1)}')
# done < Game_Files.txt 

# echo "$wins" >> ./Statistics.txt


# while IFS= read -r line
# do
#    delimited_Line_Array=$(echo "$line" | awk -F'_' '{print $(NF-1)}')
# done < Game_Files.txt 

function wins(){
 file=Game_Files.txt
 WinsAndLosses=()
 while read -r line; do
   IFS='_' read -r -a Game_Stats_Array <<< "$line"
   # Only display wins and losses
   WinsAndLosses+=$(echo ${Game_Stats_Array[7]})" "
done < "$file"
}
echo "${WinsAndLosses[@]}" >> Statistics.txt