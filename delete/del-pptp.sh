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

MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/rewasu91/public/main/ipaddress.sh | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${D}——————————————————————————————————————————${R}"
echo -e "${D1}         Proses Semakan IP Address        ${R}"
echo -e "${D}——————————————————————————————————————————${R}"
echo -e ""
clear
else
clear
echo -e "${D}——————————————————————————————————————————${R}"
echo -e "${D1}         Proses Semakan IP Address        ${R}"
echo -e "${D}——————————————————————————————————————————${R}"
echo -e ""
sleep 2
echo -e "${A} Maaf. IP address anda tidak berdaftar dengan admin! ${R}"
echo -e "${A} Sila hubungi admin di telegram KaizenVPN..${R}"
sleep 3
clear
exit 0
fi

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/Kaizen/data-user-pptp")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo -e ""
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e "${D1}                   Memadam Akaun PPTP                     ${R}"
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e ""
		echo "► Tiada akaun PPTP yang aktif. Sila buat akaun!"
		exit 1
	fi

	clear
	echo -e ""
	echo -e "${D}——————————————————————————————————————————————————————————${R}"
	echo -e "${D1}                  Memadam Akaun PPTP                      ${R}"
	echo -e "${D}——————————————————————————————————————————————————————————${R}"
	echo -e ""
	echo "► Sila pilih akaun yang ingin dipadam"
	echo "► Tekan CTRL+C untuk keluar"
	echo -e "==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/var/lib/Kaizen/data-user-pptp" | cut -d ' ' -f 2-3 | nl -s ') 
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "► Sila pilih nombor akaun yang ingin dipadam [1]: " CLIENT_NUMBER
		else
			read -rp "► Sila pilih nombor akaun yang ingin dipadam [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
	# match the selected number to a client name
	VPN_USER=$(grep -E "^### " "/var/lib/Kaizen/data-user-pptp" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/var/lib/Kaizen/data-user-pptp" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
# Delete VPN user
sed -i '/^"'"$VPN_USER"'" pptpd/d' /etc/ppp/chap-secrets
sed -i "/^### $VPN_USER $exp/d" /var/lib/Kaizen/data-user-pptp
# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Akaun PPTP Berjaya Dipadam                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
