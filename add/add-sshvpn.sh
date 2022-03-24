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

source /var/lib/Kaizen/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
clear

clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}               Membuat Akaun SSH & OpenVPN                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan Username            : " Login
egrep "^$Login" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo -e "► Username sudah digunakan. Sila gunakan username yang lain!"
sleep 1
add-sshvpn
else
read -p "► Sila masukkan Password            : " Pass
read -p "► Sila masukkan Tempoh Aktif (hari) : " masaaktif
echo -e ""

IP=$(wget -qO- ipinfo.io/ip);
sqd="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | head -n1)"
sqd2="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | tail -n1)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null

clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}               Maklumat Akaun SSH & OpenVPN              ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Username             : $Login "
echo -e "► Password             : $Pass"
echo -e "► Tempoh Aktif (Hari)  : $masaaktif Days"
echo -e "► Dibuat pada          : $hariini"
echo -e "► Expire pada          : $expi"
echo -e "► Domain               : $domain"
echo -e "► Host                 : $IP"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► IP/Host             : $IP"
echo -e "► Domain              : $domain"
echo -e "► OpenSSH             : 22,442"
echo -e "► Dropbear            : 109, 143"
echo -e "► SSL/TLS             : 443, 777, 789"
echo -e "► Port Squid          :$sqd, $sqd2"
echo -e "► OHP SSH             : 8181"
echo -e "► OHP Dropbear        : 8282"
echo -e "► OHP OpenVPN         : 8383"
echo -e "► SSH WS TLS          : 777"
echo -e "► SSH WS None TLS     : 8880"
echo -e "► OVPN Websocket      : 2086"
echo -e "► OVPN Port TCP       : $ovpn"
echo -e "► OVPN Port UDP       : $ovpn2"
echo -e "► OVPN Port SSL       : 990"
echo -e "► OVPN TCP            : http://$IP:89/tcp.ovpn"
echo -e "► OVPN UDP            : http://$IP:89/udp.ovpn"
echo -e "► OVPN SSL            : http://$IP:89/ssl.ovpn"
echo -e "► BadVpn              : 7100-7200-7300"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Payload Websocket SSL/TLS"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "GET wss://bug.com [protocol][crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Payload Websocket HTTP"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Copyright: Premium Server Kaizen"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
fi
