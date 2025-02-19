#!/usr/bin/bash

if [ -z "$1" ]
then
h=${0##*/}
echo $h archive.zip
exit 1
fi

read_zip_file_comment=$(unzip -l $1 | head -n 5 | tail -n 1)
echo "nacteny file comment ze souboru "$1" = "$read_zip_file_comment

d_read_zip_file_comment=${#read_zip_file_comment}
echo $d_read_zip_file_comment

rok=${read_zip_file_comment:0:4}
echo "-"$rok"-"
mesic=${read_zip_file_comment:5:2}
echo $"-"$mesic"-"
den=${read_zip_file_comment:8:2}
echo $"-"$den"-"
hodina=${read_zip_file_comment:11:2}
echo $"-"$hodina"-"
minuta=${read_zip_file_comment:14:2}
echo $"-"$minuta"-"
vterina=${read_zip_file_comment:17:2}
echo $"-"$vterina"-"

nacist_soubor_hesel=${read_zip_file_comment:20:${#read_zip_file_comment}-20}
nacist_soubor_hesel=${nacist_soubor_hesel%%.*}


echo "-"$nacist_soubor_hesel"-"


exit 1

source $1
#echo $(date +'%Y %m %d %H %M')

rok=$(date +'%Y')
mesic=$(date +'%m')
den=$(date +'%d')
hodina=$(date +'%H')
minuta=$(date +'%M')
vterina=$(date +%S)

#echo $rok
#echo $mesic
#echo $den
#echo $hodina
#echo $minuta
#echo vterina

#mesic="01"
#den="01"
#hodina="00"
#minuta="00"
#vterina="01"


if [ "$vterina" -lt 10 ]
then
vterina=${vterina#?}
fi

if [ "$minuta" -lt 10 ]
then
minuta=${minuta#?}
fi

if [ "$hodina" -lt 10 ]
then
hodina=${hodina#?}
fi

if [ "$mesic" -lt 10 ]
then
mesic=${mesic#?}
fi

if [ "$den" -lt 10 ]
then
den=${den#?}
fi

archiv_zip_nazev=$rok"_"$mesic"_"$den"_"$hodina"_"$minuta"_"$vterina"-"$1".zip"
#echo $archiv_zip_nazev

zip_comment=$rok"_"$mesic"_"$den"_"$hodina"_"$minuta"_"$vterina"-"$1".zip"
#zip_comment=$rok" "$mesic" "$den" "$hodina" "$minuta" "$vterina" $1"
echo $zip_comment
rm -f zip_comment.txt
sleep 1
echo $zip_comment > zip_comment.txt
sleep 1


zip_folder=$2
#
heslo=""
heslo+=${pole_roky[$rok]}
#echo $heslo
heslo+=${pole_mesice[$mesic]}
#echo $heslo
heslo+=${pole_dny[$den]}
#echo $heslo
heslo+=${pole_hodiny[$hodina]}
#echo $heslo
heslo+=${pole_minuty[$minuta]}
#echo $heslo
heslo+=${pole_vteriny[$vterina]}

#echo $heslo
d_heslo=${#heslo}
echo "heslo delka "$d_heslo" znaku"

cmd_1="zip -r -9 -y -UN=UTF8 -P "
cmd_1+="'$heslo'"
cmd_1+=" -c < 'zip_comment.txt' "
#cmd_1+=" archiv.zip aaa/"
cmd_1+=$archiv_zip_nazev
#cmd_1+=" aaa/"
cmd_1+=" "$zip_folder
#echo $cmd_1
eval $cmd_1
sleep 1

cmd_2="unzip -t -P "
cmd_2+="'$heslo' "
#cmd_2+=" archiv.zip"
cmd_2+=$archiv_zip_nazev
#echo $cmd_2
eval $cmd_2
sleep 1

cmd_3="unzip -l "
#cmd_3+="archiv.zip"
cmd_3+=$archiv_zip_nazev
#echo $cmd_3
eval $cmd_3

#zip -r -9 -y -UN=UTF8 -P '$heslo' -c < 'zip_comment.txt' archiv.zip aaa/
#&& sleep 3; unzip zip -t -P 'zdeHeslo' archiv.zip
#&& rm -v totoJeKomentarZip

echo $archiv_zip_nazev
rm -f zip_comment.txt

