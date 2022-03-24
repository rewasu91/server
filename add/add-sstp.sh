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

source /var/lib/Kaizen/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
IP=$(wget -qO- ipinfo.io/ip);

sstp="$(cat ~/log-install.txt | grep -w "► SSTP VPN" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		clear
		echo -e ""
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e "${D1}                   Membuat Akaun SSTP                     ${R}"
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e ""
		read -rp "► Sila masukkan Username	      : " -e user
		CLIENT_EXISTS=$(grep -w $user /var/lib/Kaizen/data-user-sstp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "► Username sudah berdaftar, sila pilih Username yang lain."
			exit 1
		fi
		done
		read -p "► Sila masukkan Password	     : " pass
		read -p "► Sila masukkan Tempoh Aktif (hari) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
cat >> /home/sstp/sstp_account <<EOF
$user * $pass *
EOF
echo -e "### $user $exp">>"/var/lib/Kaizen/data-user-sstp"
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                    Maklumat Akaun SSTP                   ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Server IP            : $IP"
echo -e "► Domain               : $domain"
echo -e "► Username             : $user"
echo -e "► Password             : $pass"
echo -e "► Port             	  : $sstp"
echo -e "► Cert             	  : http://$IP:89/server.crt"
echo -e "► Dibuatd pada         : $hariini"
echo -e "► Expired pada         : $exp"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
