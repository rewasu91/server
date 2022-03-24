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

clear
uuid=$(cat /proc/sys/kernel/random/uuid)
source /var/lib/Kaizen/ipvps.conf
domain=$(cat /etc/v2ray/domain)

tls="$(cat /etc/xray/xrayvlesstls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')"
none="$(cat /etc/xray/xrayvlessnonetls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		clear
		echo -e ""
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e "${D1}               Membuat Akaun Xray Vless                   ${R}"
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e ""
		read -rp "► Sila masukkan Username	       : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xrayvlesstls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "► Username sudah berdaftar, sila pilih Username yang lain."
			exit 1
		fi
	done
read -p "► Sila masukkan Tempoh Aktif (hari)  : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# // Input To Server
sed -i '/#xrayvlesstls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xrayvlesstls.json
sed -i '/#xrayvlessnonetls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xrayvlessnonetls.json

vtls="vless://${uuid}@${domain}:$tls?path=/xray&security=tls&encryption=none&type=tcp&sni=${domain}#${user}"
vnone="vless://${uuid}@${domain}:$none?path=/xray&encryption=none&type=tcp&sni=${domain}#${user}"
systemctl restart xrayvlesstls.service
systemctl restart xrayvlessnonetls.service

clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Maklumat Akaun Xray Vless                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Remarks        		: ${user}"
echo -e "► Domain         		: ${domain}"
echo -e "► Port Vless Tcp Tls		: $tls"
echo -e "► Port Vless Tcp None TLS	: $none"
echo -e "► ID       	  		: ${uuid}"
echo -e "► Dibuat pada                  : $hariini"
echo -e "► Expire pada    		: $exp"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Link Xray Vless Tcp Tls"
echo -e "► ${vtls}"
echo -e ""
echo -e "► Link Xray Tcp None TLS"
echo -e "► ${vnone}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
