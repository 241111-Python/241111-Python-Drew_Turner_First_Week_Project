
#
#line=$(cat Game_Files.txt)
#
## Set the Internal Field Separator to '_'
#IFS='_' read -r -a Game_Stats_Array <<< "$line"
#
## Access array elements
## Example: print the entire array or specific elements
#echo "Array elements:"
#for element in "${Game_Stats_Array[@]}"; do
#    echo "$element"
#done
#
#
## Example: Access specific elements
#echo "First element: ${Game_Stats_Array[0]}"
#echo "Second element: ${Game_Stats_Array[1]}"



 file=Game_Files.txt
 Wins=()
 while read -r line; do
   IFS='_' read -r -a Game_Stats_Array <<< "$line"
   # Only display wins or losses
   Wins+=$(echo ${Game_Stats_Array[$line]})" "
done < "$file"



# echo -e "\n${Wins[@]}"
 # for WinOrLoss in "${!Wins[@]}"; do
 #   echo -e "${Wins[$WinOrLoss]}\n"
 #   
 # done

# printf '%s\n' "${Wins[@]}"

# for ((i=0; i < ${#Wins[@]}; i++ )); do echo ""${Wins[$i]}" echo " ""; done

