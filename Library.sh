#!/bin/bash

# function word_salad(){
#  file=Game_Files.txt
#  Words=()
#  while read -r line; do
#    IFS='_' read -r -a Game_Stats_Array <<< "$line"
#    # Only display words guessed
#    Words+=$(echo ${Game_Stats_Array[7]})" "
# done < "$file"
# echo "$Words"
# }

function wins(){
 file=Game_Files.txt
 WinsAndLosses=()
 while read -r line; do
   IFS='_' read -r -a Game_Stats_Array <<< "$line"
   # Only display words guessed
   WinsAndLosses+=$(echo ${Game_Stats_Array[7]})" "
done < "$file"

Target="Win"
WinCount=0

for WinOrLoss in "${WinsAndLosses[@]}"; do
    if [[ "$WinOrLoss"=="$Target" ]]; then
        ((WinCount+=1))
    fi
done

# Print the result
echo "$WinCount"

}

echo ""