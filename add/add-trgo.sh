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

uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/Kaizen/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

trgo=$(cat /etc/trojan-go/config.json | grep local_port | sed 's/"//g' | sed 's/local_port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g' | sed 's/     //g')
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		clear
		echo -e ""
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e "${D1}                Membuat Akaun Trojan Go                   ${R}"
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e ""
		read -rp "► Sila masukkan Password	       : " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "► Username sudah berdaftar, sila pilih Username yang lain."
			exit 1
		fi
	done
read -p "► Sila masukkan Tempoh Aktif (hari)  : " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service

link="trojan-go://${user}@${domain}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=/TrGo&encryption=none#$user"

clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}               Maklumat Akaun Trojan Go                    {R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Remarks         : ${user}"
echo -e "► Host/IP         : ${domain}"
echo -e "► Port            : ${trgo}"
echo -e "► Key             : ${user}"
echo -e "► Encryption      : none"
echo -e "► Path  	   : /TrGo"
echo -e "► Dibuat pada     : $hariini"
echo -e "► Expire pada     : $exp"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Link Trojan Go"
echo -e "► ${link}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
