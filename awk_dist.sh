#!/bin/bash

file="$1"

min_linha=$(awk 'NR==2 || (NR>1 && $2 < min) {min=$2; linha=$0} END {print linha}' "$file")
max_linha=$(awk 'NR==2 || (NR>1 && $2 > max) {max=$2; linha=$0} END {print linha}' "$file")

echo "Linha com menor valor: $min_linha" >> max_min_"$file".txt
echo "Linha com maior valor: $max_linha" >> max_min_"$file".txt
