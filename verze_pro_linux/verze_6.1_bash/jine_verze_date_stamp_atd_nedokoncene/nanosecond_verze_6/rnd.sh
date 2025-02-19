#!/usr/bin/bash

: '
str_nano=""
#for i in {1..10};do # bude 90 znaku
for (( i = 1; i <= $max; i++)); do
nano=$(date +%N)
# zde zmenit !!!! za random
echo $nano
str_nano+=$nano
done
'

max=1000

str_rnd=""
for (( i = 1; i <= $max; i++)); do
rnd=$(( $RANDOM % 10 + 0 ))
str_rnd+=$rnd
done

echo $str_rnd
d_str_rnd=${#str_rnd}
echo $d_str_rnd" <<<"


