#!/usr/bin/bash

if [ -z "$1" ]
then
h=${0##*/}
echo $h InputtFile
exit 1
fi

source $1

stamp=$(date +%s)
echo $stamp
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

#
heslo=""
heslo+=${pole_seg_1[$seg_1]}
heslo+=${pole_seg_2[$seg_2]}
heslo+=${pole_seg_3[$seg_3]}
heslo+=${pole_seg_4[$seg_4]}
heslo+=${pole_seg_5[$seg_5]}
heslo+=${pole_seg_6[$seg_6]}
heslo+=${pole_seg_7[$seg_7]}
heslo+=${pole_seg_8[$seg_8]}
heslo+=${pole_seg_9[$seg_9]}
heslo+=${pole_seg_10[$seg_10]}

echo $heslo

d_heslo=${#heslo}
#echo $d_heslo
echo""

