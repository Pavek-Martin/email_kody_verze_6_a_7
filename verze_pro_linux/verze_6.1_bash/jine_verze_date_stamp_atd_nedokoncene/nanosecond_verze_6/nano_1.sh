#!/usr/bin/bash

for i in {1..10};do
echo $(date +%N)
#sleep 1

pockat=$(( $RANDOM % 10 + 0 ))
cekej="sleep 0."$pockat
echo $cekej
eval $cekej




done

