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
domain=$(cat /etc/v2ray/domain)

tls=$(cat /etc/xray/xrayvmesstls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
none=$(cat /etc/xray/xrayvmessnonetls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
mkcp=$(cat /etc/xray/xrayvmessmkcp.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		clear
		echo -e ""
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e "${D1}               Membuat Akaun Xray Vmess                   ${R}"
		echo -e "${D}——————————————————————————————————————————————————————————${R}"
		echo -e ""
		read -rp "► Sila masukkan Username	       : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/xrayvmesstls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "► Username sudah berdaftar, sila pilih Username yang lain."
			exit 1
		fi
	done
  
read -p "► Sila masukkan Tempoh Aktif (hari)  : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xrayvmesstls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xrayvmesstls.json
sed -i '/#xrayvmessnonetls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xrayvmessnonetls.json
sed -i '/#xrayvmessmkcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xrayvmessmkcp.json
cat > /etc/xray/$user-tls.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "/xray",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
cat > /etc/xray/$user-none.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "/xray",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
cat > /etc/xray/$user-mkcp.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${mkcp}",
      "id": "${uuid}",
      "aid": "0",
      "net": "kcp",
      "path": "",
      "type": "dtls",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(base64 -w 0 /etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /etc/xray/$user-none.json)"
vmesslink3="vmess://$(base64 -w 0 /etc/xray/$user-mkcp.json)"

# // Restarting Service
systemctl restart xrayvmesstls.service
systemctl restart xrayvmessnonetls.service
systemctl restart xrayvmessmkcp.service
service cron restart
clear

clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Maklumat Akaun Xray Vmess                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Remarks                      : ${user}"
echo -e "► Domain                       : ${domain}"
echo -e "► Port Xray Vmess Tcp Tls	: ${tls}"
echo -e "► Port Xray Vmess TCP None Tls	: ${none}"
echo -e "► Port Xray Vmess KCP	        : ${mkcp}"
echo -e "► ID       	                : ${uuid}"
echo -e "► Dibuat pada                  : $hariini"
echo -e "► Expire pada                  : $exp"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Link Xray Vmess Tcp Tls"
echo -e "► ${vmesslink1}"
echo -e ""
echo -e "► Link Xray Vmess TCP None Tls"
echo -e "► ${vmesslink2}"
echo -e ""
echo -e "► Link Xray Vmess KCP"
echo -e "► ${vmesslink3}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
