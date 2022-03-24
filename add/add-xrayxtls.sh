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

clear
MYIP=$(wget -qO- ipinfo.io/ip);
IP=$( curl -s ipinfo.io/ip )
uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)

if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

port=$(cat /etc/xray/xrayxtls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		clear
		echo -e ""
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e "${D1}               Membuat Akaun XrayVless                    ${R}"
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e ""
		read -rp "► Sila masukkan Username	       : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xrayxtls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "► user sudah berdaftar, sila pilih user yang lain."
			exit 1
		fi
	done
read -p "► Sila masukkan Tempoh Aktif (hari)  : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# // Input Data User Ke XRay Vless TCP XTLS
sed -i '/#xrayxtls$/a\#DEPAN '"Username : $user | Expired : $exp"'\
            },{"id": "'""$uuid""'","flow": "'xtls-rprx-direct'"\
#BELAKANG '"Username : $user | Expired : $exp"'' /etc/xray/xrayxtls.json

vd="vless://$uuid@$domain:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$domain#$user"
vu="vless://$uuid@$domain:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct-udp443&sni=$domain#$user"
vs="vless://$uuid@$domain:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$domain#$user"
vsu="vless://$uuid@$domain:$port?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice-udp443&sni=$domain#$user"

# // Restarting Service
systemctl restart xrayxtls.service

clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}             Maklumat Akaun Xray Vless Xtls               ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Remarks             : ${user}"
echo -e "► Domain              : ${domain}"
echo -e "► Port Vless Tcp Xtls : $port"
echo -e "► ID       	       : ${uuid}"
echo -e "► Dibuat pada         : $hariini"
echo -e "► Expire pada         : $exp"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Link Xray Vless Tcp Xtls Splice"
echo -e "► ${vs}"
echo -e ""
echo -e "► Link Xray Vless Tcp Xtls Splice UDP443"
echo -e "► ${vsu}"
echo -e ""
echo -e "► Link Xray Vless Tcp Xtls Direct"
echo -e "► ${vd}"
echo -e ""
echo -e "► Link Xray Vless Tcp Xtls Direct UDP443"
echo -e "► ${vu}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
