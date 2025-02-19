#!/usr/bin/bash

str=""

for i in {1..11};do
nanosekund=$(date +%N)
echo $nanosekund
str+=$nanosekund

pockat=$(( $RANDOM % 10 + 0 ))
cekej="sleep 0."$pockat
echo $cekej
eval $cekej
str+="-"
done
echo $str
d_str=${#str}
echo $d_str

