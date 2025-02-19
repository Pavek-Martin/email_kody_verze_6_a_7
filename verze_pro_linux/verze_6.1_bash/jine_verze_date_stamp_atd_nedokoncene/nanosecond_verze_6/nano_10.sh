#!/usr/bin/bash


if [ -z "$1" ]
then
h=${0##*/}
echo $h OutputFile
exit 1
fi

pole_znaky=( {a..z} {A..Z} {0..9} )
#declare -p pole_znaky

d_pole_znaky=${#pole_znaky[@]}


d_key=2

#d_key=1 # nastavi delku pro vsechny najednou

#funkce key vygeneruje strins 5 nahodnych znaku ascii
key () {
declare -n key_out=$1
key_out=""
#declare -n d_key=$2
for (( znak = 1; znak <= $d_key; znak++)); do
rnd=$(( $RANDOM % $d_pole_znaky + 0 ))
key_out+=${pole_znaky[$rnd]}
done
}


str_nano=""
for i in {1..10};do # bude 99 znaku
nano=$(date +%N)
echo $nano
str_nano+=$nano

pockat=$(( $RANDOM % 10 + 0 ))
cekej="sleep 0."$pockat
echo $cekej
eval $cekej
done

echo $str_nano
d_str_nano=${#str_nano}
echo $d_str_nano



for (( n_x = 1; n_x <= $d_str_nano; n_x++)); do
seg=${str_nano:$n_x:1}
echo $seg

n_1=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
#n_$seg[$aa]=$key
n_1[$aa]=$key


done
declare -p n_1
declare -p n_1 >>$1


done


echo "xxx"


