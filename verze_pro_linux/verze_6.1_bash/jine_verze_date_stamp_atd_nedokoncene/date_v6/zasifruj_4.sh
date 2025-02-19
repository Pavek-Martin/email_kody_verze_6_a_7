#!/usr/bin/bash

if [ -z "$1" ]
then
h=${0##*/}
echo $h InputFile
exit 1
fi

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


zip_comment=$rok" "$mesic" "$den" "$hodina" "$minuta" "$vterina" $1"
echo $zip_comment
rm -f zip_comment.txt
sleep 1
echo $zip_comment > zip_comment.txt
sleep 1

archiv_zip_nazev=$rok"_"$mesic"_"$den"_"$hodina"_"$minuta"_"$vterina"-"$1".zip"
#echo $archiv_zip_nazev

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

echo $heslo
d_heslo=${#heslo}
echo "heslo delka "$d_heslo" znaku"

cmd_1="zip -r -9 -y -UN=UTF8 -P "
cmd_1+="'$heslo'"
cmd_1+=" -c < 'zip_comment.txt' "
#cmd_1+=" archiv.zip aaa/"
cmd_1+=$archiv_zip_nazev
cmd_1+=" aaa/"
echo $cmd_1
eval $cmd_1
sleep 1

cmd_2="unzip -t -P "
cmd_2+="'$heslo' "
#cmd_2+=" archiv.zip"
cmd_2+=$archiv_zip_nazev
echo $cmd_2
eval $cmd_2
sleep 1

cmd_3="unzip -l "
#cmd_3+="archiv.zip"
cmd_3+=$archiv_zip_nazev
echo $cmd_3
eval $cmd_3

#zip -r -9 -y -UN=UTF8 -P '$heslo' -c < 'zip_comment.txt' archiv.zip aaa/
#&& sleep 3; unzip zip -t -P 'zdeHeslo' archiv.zip
#&& rm -v totoJeKomentarZip

echo $archiv_zip_nazev
