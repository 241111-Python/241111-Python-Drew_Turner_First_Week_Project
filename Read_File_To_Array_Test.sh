
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

while read -r line; do
  IFS='_' read -r -a Game_Stats_Array <<< "$line"
  # Only display wins or losses
  echo ${Game_Stats_Array[5]}
done < "$file"



