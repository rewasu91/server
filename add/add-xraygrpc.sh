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

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

clear
uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /etc/v2ray/domain)
MYIP=$(curl -sS ipv4.icanhazip.com)

tls=$(cat /etc/xray/xrayvmessgrpc.json | grep port | awk '{print $2}' | sed 's/,//g')
vl=$(cat /etc/xray/xrayvlessgrpc.json | grep port | awk '{print $2}' | sed 's/,//g')
    until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		clear
		echo -e ""
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e "${D1}                Membuat Akaun Xray Grpc                   ${R}"
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e ""
		read -rp "► Sila masukkan Username	       : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xrayvmessgrpc.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "► Username sudah berdaftar, sila pilih Username yang lain."
			exit 1
		fi
	done
read -p "► Sila masukkan Tempoh Aktif (hari)  : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xrayvmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xrayvmessgrpc.json
sed -i '/#xrayvlessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xrayvlessgrpc.json
cat > /etc/xray/$user-tls.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "GunService",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /etc/xray/$user-tls.json)"
vlesslink1="vless://${uuid}@${domain}:${vl}?mode=gun&security=tls&encryption=none&type=grpc&serviceName=GunService&sni=${domain}#$user"
systemctl restart xrayvmessgrpc.service
systemctl restart xrayvlessgrpc.service
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Maklumat Akaun Xray Grpc                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Remarks              : ${user}"
echo -e "► Domain               : ${domain}"
echo -e "► Port Xray Vless Grpc	: ${vl}"
echo -e "► Port Xray Vmess Grpc	: ${tls}"
echo -e "► ID                   : ${uuid}"
echo -e "► Alter ID             : 0"
echo -e "► Mode                 : Gun"
echo -e "► Security             : TLS"
echo -e "► Type                 : grpc"
echo -e "► Service Name         : GunService"
echo -e "► SNI                  : ${domain}"
echo -e "► Dibuat pada          : $hariini"
echo -e "► Expire pada          : $exp"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Link Xray Vless Grpc"
echo -e "► ${vlesslink1}"
echo -e ""
echo -e "► Link Xray Vmess Grpc"
echo -e "► ${vmesslink1}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
