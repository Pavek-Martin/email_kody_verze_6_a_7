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
#d_key=4

#funkce key vygeneruje strins 5 nahodnych znaku ascii
key () {
declare -n key_out=$1
key_out=""
#declare -n d_key=$2
#for (( znak = 1; znak <= 25; znak++)); do
#for (( znak = 1; znak <= 10; znak++)); do
for (( znak = 1; znak <= $d_key; znak++)); do
rnd=$(( $RANDOM % $d_pole_znaky + 0 ))
key_out+=${pole_znaky[$rnd]}
done
}

# roky, letosek plus daksich 10 let

letosek=$(date +%Y)

pole_roky=()
for (( rok = $letosek; rok <= $letosek + 10; rok++)); do
d_key=1
key key d_key
pole_roky[$rok]=$key
done

declare -p pole_roky
declare -p pole_roky >$1

# mesice
pole_mesice=()
for (( mesic = 1; mesic <= 12 ; mesic++)); do
d_key=2
key key d_key
pole_mesice[$mesic]=$key
done

declare -p pole_mesice
declare -p pole_mesice >>$1

# dny
pole_dny=()
for (( den = 1; den <= 31; den++)); do
d_key=3
key key d_key
pole_dny[$den]=$key
done

declare -p pole_dny
declare -p pole_dny >>$1

# hodiny
pole_hodiny=()
for (( hodina = 0; hodina <= 23; hodina++)); do
d_key=4
key key d_key
pole_hodiny[$hodina]=$key
done

declare -p pole_hodiny
declare -p pole_hodiny >>$1

# minuty
pole_minuty=()
for (( minut = 0; minut <= 59; minut++)); do
d_key=5
key key d_key
pole_minuty[$minut]=$key
done

declare -p pole_minuty
declare -p pole_minuty >>$1

pole_vteriny=()
for (( vterin = 0; vterin <= 59; vterin++)); do
d_key=2
key key _d_key
pole_vteriny[$vterin]=$key
done

declare -p pole_vteriny
declare -p pole_vteriny >>$1

