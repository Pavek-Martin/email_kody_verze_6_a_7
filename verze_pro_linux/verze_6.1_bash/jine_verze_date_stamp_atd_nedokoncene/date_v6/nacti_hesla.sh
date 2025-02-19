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

#minuta="00"
#hodina="00"
#mesic="01"
#den="01"
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


echo $rok" "$mesic" "$den" "$hodina" "$minuta" "$vterina

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


