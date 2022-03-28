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

NUMBER_OF_CLIENTS=$(grep -c -E "^#DEPAN " "/etc/xray/xrayxtls.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo -e ""
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e "${D1}              Memadam Akaun Xray Vless Xtls               ${R}"
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e ""
		echo "► Tiada akaun XrayVless yang aktif. Sila buat akaun!"
		exit 1
	fi

	clear
	echo -e ""
	echo -e "${D}——————————————————————————————————————————————————————————${R}"
	echo -e "${D1}              Memadam Akaun Xray Vless Xtls               ${R}"
	echo -e "${D}——————————————————————————————————————————————————————————${R}"
	echo -e ""
	echo "► Sila pilih akaun yang ingin dipadam"
	echo "► Tekan CTRL+C untuk keluar"
	echo -e "==============================="	
	echo "     No  Expired   User"
	grep -e "^#DEPAN " "/etc/xray/xrayxtls.json" | cut -d ' ' -f 2-8 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "► Sila pilih nombor akaun yang ingin dipadam [1]: " CLIENT_NUMBER
		else
			read -rp "► Sila pilih nombor akaun yang ingin dipadam [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep "^#DEPAN " "/etc/xray/xrayxtls.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep "^#DEPAN " "/etc/xray/xrayxtls.json" | cut -d ' ' -f 8 | sed -n "${CLIENT_NUMBER}"p)

sed -i "/^#DEPAN Username : $user | Expired : $exp/,/^#BELAKANG Username : $user | Expired : $exp/d" /etc/xray/xrayxtls.json

systemctl restart xrayxtls.service

echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}           Akaun Xray Vless Xtls Berjaya Dipadam          ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
