#!/bin/bash

function concatonate_strings(){
array="(@)"
strings=""
for string in "{$1[@]}"; do
strings=$((strings+"string"))
done
echo $sum
}