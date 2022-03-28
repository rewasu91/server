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

NUMBER_OF_CLIENTS=$(grep -c -E "^#&# " "/etc/xray/xraytrojangrpc.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e "${D1}           Perbaharui Akaun Xray Trojan Grpc              ${R}"
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e ""
		echo "► Tiada akaun Xray Trojan Grpc yang aktif. Sila buat akaun!"
		echo -e ""
		exit 1
	fi
	clear
	echo -e ""
	echo -e "${D}——————————————————————————————————————————————————————————${R}"
	echo -e "${D1}           Perbaharui Akaun Xray Trojan Grpc              ${R}"
	echo -e "${D}——————————————————————————————————————————————————————————${R}"
	echo -e ""
	echo "► Sila pilih akaun yang anda ingin perbaharui"
	echo "► Tekan CTRL+C untuk keluar"
	echo -e "==============================="
	grep -E "^#&# " "/etc/xray/xraytrojangrpc.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "► Sila pilih nombor akaun yang ingin perbaharui [1]: " CLIENT_NUMBER
		else
			read -rp "► Sila pilih nombor akaun yang ingin perbaharui [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "► Tambah berapa hari? : " masaaktif
user=$(grep -E "^#&# " "/etc/xray/xraytrojangrpc.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#&# " "/etc/xray/xraytrojangrpc.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#&# $user $exp/#&# $user $exp4/g" /etc/xray/xraytrojangrpc.json
systemctl restart xraytrojangrpc.service
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}Maklumat Akaun Xray Trojan Grpc Yang Sudah Diperbaharui   ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Username                   :  $user"
echo -e "► Expire pada                :  $exp4"
echo -e "✅ Akaun berjaya diperbaharui, terima kasih!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
