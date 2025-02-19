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


d_key=1

#d_key=1 # nastavi delku pro vsechny najednou

#funkce key vygeneruje strins 5 nahodnych znaku ascii
key () {
declare -n key_out=$1
key_out=""
#declare -n d_key=$2
for (( znak = 0; znak <= $d_key; znak++)); do
rnd=$(( $RANDOM % $d_pole_znaky + 0 ))
key_out+=${pole_znaky[$rnd]}
done
}


str_nano=""
for i in {1..10};do # bude 90 znaku
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
echo $d_str_nano"<<<"
sleep 5

#for (( n_x = 0; n_x <= $d_str_nano -1; n_x++)); do
for (( n_x = 0; n_x <= $d_str_nano - 1; n_x++)); do
seg=${str_nano:$n_x:1}
echo $seg


# n_1=()
cmd="n_"$n_x"=()"
#echo $cmd
eval $cmd


for (( aa = 0; aa<= 9; aa++)); do
key key d_key
#n_1[$aa]=$key
cmd2="n_"$n_x"[$aa]=$key"
#echo $cmd2
eval $cmd2

#declare -p n_1
#declare -p n_1 >>$1
done

cmd3="declare -p n_"$n_x
echo $cmd3
eval $cmd3

cmd4="declare -p n_"$n_x" >>$1"
#echo $cmd4
eval $cmd4


done

echo "zde"


