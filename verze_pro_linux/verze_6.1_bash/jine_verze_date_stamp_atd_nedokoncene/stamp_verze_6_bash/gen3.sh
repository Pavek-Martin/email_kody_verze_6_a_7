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

stamp=$(date +%s)
#echo $stamp
seg_1=${stamp:0:1}
#echo $seg_1
seg_2=${stamp:1:1}
#echo $seg_2
seg_3=${stamp:2:1}
#echo $seg_3
seg_4=${stamp:3:1}
#echo $seg_4
seg_5=${stamp:4:1}
#echo $seg_5
seg_6=${stamp:5:1}
#echo $seg_6
seg_7=${stamp:6:1}
#echo $seg_7
seg_8=${stamp:7:1}
#echo $seg_8
seg_9=${stamp:8:1}
#echo $seg_9
seg_10=${stamp:9:1}
#echo $seg_10


d_key=1
pole_seg_1=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_1[$aa]=$key
done
declare -p pole_seg_1
declare -p pole_seg_1 >>$1

d_key=2
pole_seg_2=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_2[$aa]=$key
done
declare -p pole_seg_2
declare -p pole_seg_2 >>$1

d_key=3
pole_seg_3=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_3[$aa]=$key
done
declare -p pole_seg_3
declare -p pole_seg_3 >>$1

d_key=4
pole_seg_4=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_4[$aa]=$key
done
declare -p pole_seg_4
declare -p pole_seg_4 >>$1

d_key=5
pole_seg_5=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_5[$aa]=$key
done
declare -p pole_seg_5
declare -p pole_seg_5 >>$1

d_key=1
pole_seg_6=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_6[$aa]=$key
done
declare -p pole_seg_6
declare -p pole_seg_6 >>$1

d_key=2
pole_seg_7=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_7[$aa]=$key
done
declare -p pole_seg_7
declare -p pole_seg_7 >>$1

d_key=3
pole_seg_8=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_8[$aa]=$key
done
declare -p pole_seg_8
declare -p pole_seg_8 >>$1

d_key=4
pole_seg_9=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_9[$aa]=$key
done
declare -p pole_seg_9
declare -p pole_seg_9 >>$1

d_key=5
pole_seg_10=()
for (( aa = 0; aa<= 9; aa++)); do
key key d_key
pole_seg_10[$aa]=$key
done
declare -p pole_seg_10
declare -p pole_seg_10 >>$1


