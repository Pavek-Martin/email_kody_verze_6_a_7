#!/usr/bin/bash

cesta_soubory_hesel="/home/pi/bash/verze_6_bash/"

if [ -z "$2" ]
then
h=${0##*/}
echo $h $cesta_soubory_hesel"SouborHesel" zip_folder/
exit 1
fi

soubor_hesel=$1
source $soubor_hesel

soubor_hesel=${soubor_hesel##*/}
# vyhaze vsechny lomitka z cesty, kvuli nazvu archivu
zip_folder=$2

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

#archiv_zip_nazev=$rok"_"$mesic"_"$den"_"$hodina"_"$minuta"_"$vterina"-"$soubor_hesel".zip"
archiv_zip_nazev=${zip_folder:0:${#zip_folder}-1}"_v6.zip"
echo "nazev archivu zip je"
echo $archiv_zip_nazev

zip_comment=$rok"_"$mesic"_"$den"_"$hodina"_"$minuta"_"$vterina"-"$soubor_hesel".zip"
#zip_comment=$rok" "$mesic" "$den" "$hodina" "$minuta" "$vterina" $soubor_hesel"
echo "file comment souboru "$archiv_zip_nazev" je "$zip_comment
rm -f zip_comment.txt
sleep 1
echo $zip_comment > zip_comment.txt
sleep 1


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

echo "heslo souboru je"
echo $heslo
d_heslo=${#heslo}
echo "delka hesla je "$d_heslo" znaku"

cmd_1="zip -r -9 -y -UN=UTF8 -P "
cmd_1+="'$heslo'"
cmd_1+=" -c < 'zip_comment.txt' "
cmd_1+=$archiv_zip_nazev
cmd_1+=" "$zip_folder
eval $cmd_1
sleep 1

cmd_2="unzip -t -P "
cmd_2+="'$heslo' "
cmd_2+=$archiv_zip_nazev
eval $cmd_2
sleep 1

cmd_3="unzip -l "
cmd_3+=$archiv_zip_nazev
eval $cmd_3

#zip -r -9 -y -UN=UTF8 -P '$heslo' -c < 'zip_comment.txt' archiv.zip aaa/
#&& sleep 3; unzip zip -t -P 'zdeHeslo' archiv.zip
#&& rm -v totoJeKomentarZip

#echo $archiv_zip_nazev
rm -f zip_comment.txt

