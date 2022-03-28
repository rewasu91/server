#!/bin/bash

#text,A=Merah,B=Hijau,C=Magenta,D=Cyan
A='\033[1;31m'
B='\033[1;32m'
C='\033[1;35m'
D='\033[1;36m'
#background,A1=Merah,B1=Hijau,C1=Magenta,D1=Cyan
A1='\033[1;41m'
B1='\033[1;42m'
C1='\033[1;45m'
D1='\033[1;46m'
#reset
R='\033[0m'

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
MYIP=$(curl -sS ipv4.icanhazip.com)

clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}               Memadam Akaun SSH & OpenVPN                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan username yang ingin dipadam : " Pengguna
echo -e ""
if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e ""
	echo -e "${D}——————————————————————————————————————————————————————————${R}"
	echo -e "${D1}           Akaun SSH & OpenVPN Berjaya Dipadam            ${R}"
	echo -e "${D}——————————————————————————————————————————————————————————${R}"
	echo -e ""
else
        echo -e "► Username $Pengguna tidak ada didalam sistem VPS."
fi
echo -e ""
