#!/usr/bin/bash

if [ -z "$1" ]
then
h=${0##*/}
echo $h archive.zip
exit 1
fi

cesta_soubory_hesel="/home/pi/bash/verze_6_bash/"

rm -f main_comment_file.txt
sleep 0.2
touch main_comment_file.txt
zip -z < main_comment_file.txt $1
sleep 0.2
rm -f main_comment_file.txt

read_zip_file_comment=$(unzip -l $1 | head -n 5 | tail -n 1)
echo "nacteny file comment ze souboru "$1" je "$read_zip_file_comment

d_read_zip_file_comment=${#read_zip_file_comment}
#echo $d_read_zip_file_comment

rok=${read_zip_file_comment:0:4}
#echo "-"$rok"-"
mesic=${read_zip_file_comment:5:2}
#echo $"-"$mesic"-"
den=${read_zip_file_comment:8:2}
#echo $"-"$den"-"
hodina=${read_zip_file_comment:11:2}
#echo $"-"$hodina"-"
minuta=${read_zip_file_comment:14:2}
#echo $"-"$minuta"-"
vterina=${read_zip_file_comment:17:2}
#echo $"-"$vterina"-"

nacist_soubor_hesel=${read_zip_file_comment:20:${#read_zip_file_comment}-20}
nacist_soubor_hesel=${nacist_soubor_hesel%%.*}
#echo "-"$nacist_soubor_hesel"-"
echo "bude pouzit soubor hesel"

echo $cesta_soubory_hesel$nacist_soubor_hesel

xxx=$cesta_soubory_hesel$nacist_soubor_hesel
source $xxx

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

echo "zjistene heslo z archive file comment je"
echo $heslo
d_heslo=${#heslo}
echo "delka hesla je "$d_heslo" znaku"

#zip -r -9 -y -UN=UTF8 -P '$heslo' -c < 'zip_comment.txt' archiv.zip aaa/
#&& sleep 3; unzip zip -t -P 'zdeHeslo' archiv.zip
#&& rm -v totoJeKomentarZip

echo $archiv_zip_nazev

#c2 = "unzip -t -P '"..heslo.."' "..vybrany_soubor_zip.."
#&& sleep 5; unzip -x -P '"..heslo.."' "..vybrany_soubor_zip.." -d "..cesta slozka zip

cmd_1="unzip -t -P "
cmd_1+="'$heslo' "
cmd_1+="$1"
#echo $cmd_1
eval $cmd_1
sleep 1

cmd_2="unzip -x -P "
cmd_2+="'$heslo' "
cmd_2+=$1
#echo $cmd_2
eval $cmd_2








