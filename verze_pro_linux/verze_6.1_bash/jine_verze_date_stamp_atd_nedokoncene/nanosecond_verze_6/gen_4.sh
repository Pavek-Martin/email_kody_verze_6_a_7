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

d_key=5 # nastavi delku pro vsechny najednou

max=100

str_rnd=""
for (( i = 1; i <= $max; i++)); do
rnd=$(( $RANDOM % 10 + 0 ))
str_rnd+=$rnd
done

echo $str_rnd
d_str_rnd=${#str_rnd}
echo "delka = "$d_str_rnd" znaku"

sleep 3


for (( n_x = 0; n_x <= $d_str_rnd - 1; n_x++)); do
seg=${str_rnd:$n_x:1}
echo $seg


# n_1=()
#cmd="n_"$n_x"=()"
cmd="n_"$(($n_x + 1))"=()"
#echo $cmd
eval $cmd


for (( aa = 0; aa<= 9; aa++)); do
key key d_key
#n_1[$aa]=$key
#cmd2="n_"$n_x"[$aa]=$key"
cmd2="n_"$(($n_x + 1))"[$aa]=$key"
#echo $cmd2
eval $cmd2

#declare -p n_1
#declare -p n_1 >>$1
done

#cmd3="declare -p n_"$n_x
cmd3="declare -p n_"$(($n_x + 1))
#echo $cmd3
eval $cmd3

#cmd4="declare -p n_"$n_x" >>$1"
cmd4="declare -p n_"$(($n_x + 1))" >>$1"
#echo $cmd4
eval $cmd4

done


