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
for i in {1..11};do # bude 99 znaku
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


d_key=1


for (( n_x = 0; n_x <= $d_str_nano; n_x++)); do
seg=${str_nano:$n_x:1}
echo $seg

n_1=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
#n_$seg[$aa]=$key
n_1[$aa]=$key


declare -p n_1
declare -p n_1 >>$1


done
done




: '
d_key=1
n_1=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_1[$aa]=$key
done
declare -p n_1
declare -p n_1 >>$1

d_key=2
n_2=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_2[$aa]=$key
done
declare -p n_2
declare -p n_2 >>$1

d_key=3
n_3=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_3[$aa]=$key
done
declare -p n_3
declare -p n_3 >>$1

d_key=4
n_4=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_4[$aa]=$key
done
declare -p n_4
declare -p n_4 >>$1

d_key=5
n_5=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_5[$aa]=$key
done
declare -p n_5
declare -p n_5 >>$1

d_key=1
n_6=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_6[$aa]=$key
done
declare -p n_6
declare -p n_6 >>$1

d_key=2
n_7=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_7[$aa]=$key
done
declare -p n_7
declare -p n_7 >>$1

d_key=3
n_8=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_8[$aa]=$key
done
declare -p n_8
declare -p n_8 >>$1

d_key=4
n_9=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_9[$aa]=$key
done
declare -p n_9
declare -p n_9 >>$1

d_key=5
n_10=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
n_10[$aa]=$key
done
declare -p n_10
declare -p n_10 >>$1
'
echo "xxx"


