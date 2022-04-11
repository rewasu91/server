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

red="\e[1;31m"
green="\e[0;32m"
NC="\e[0m"
clear
echo "" 
echo -e "${D}——————————————————————————————————————————${R}"
echo -e "${D1}               STATUS SISTEM              ${R}"
echo -e "${D}——————————————————————————————————————————${R}"
echo "" 
echo -e "${C}SERVIS SSH, OPENVPN, SQUID & STUNNEL${R}"
status="$(systemctl show ssh.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSH                  : "$green"running"$NC" ✓"
else
echo -e " SSH                  : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show openvpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Openvpn              : "$green"running"$NC" ️✓"
else
echo -e " Openvpn              : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show stunnel4.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Stunnel4             : "$green"running"$NC" ✓"
else
echo -e " Stunnel4             : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Dropbear             : "$green"running"$NC" ✓"
else
echo -e " Dropbear             : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show squid.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Squid                : "$green"running"$NC" ✓"
else
echo -e " Squid                : "$red"not running (Error)"$NC" ❌"
fi
echo -e "${C}SERVIS WEBSOCKET${R}"
status="$(systemctl show ws-stunnel.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " WebSocket TLS        : "$green"running"$NC" ✓"
else
echo -e " WebSocket TLS        : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show websocket.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " WebSocket None TLS   : "$green"running"$NC" ✓"
else
echo -e " WebSocket None TLS   : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show ws-ovpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " WebSocket OpenVPN    : "$green"running"$NC" ✓"
else
echo -e " WebSocket OpenVPN    : "$red"not running (Error)"$NC" ❌"
fi
echo -e "${C}SERVIS OHP${R}"
status="$(systemctl show ssh-ohp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OHP OpenSSH          : "$green"running"$NC" ✓"
else
echo -e " OHP OpenSSH          : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show openvpn-ohp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OHP OpenVPN          : "$green"running"$NC" ✓"
else
echo -e " OHP OpenVPN          : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show dropbear-ohp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OHP Dropbear         : "$green"running"$NC" ✓"
else
echo -e " OHP Dropbear         : "$red"not running (Error)"$NC" ❌"
fi
echo -e "${C}SERVIS V2RAY${R}"
status="$(systemctl show v2ray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Vmess Tls      : "$green"running"$NC" ✓"
else
echo -e " V2ray Vmess Tls      : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show v2ray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Vmess None Tls : "$green"running"$NC" ✓"
else
echo -e " V2ray Vmess None Tls : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show v2ray@vless.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Vless Tls      : "$green"running"$NC" ✓"
else
echo -e " V2ray Vless Tls      : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show v2ray@vnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Vless None Tls : "$green"running"$NC" ✓"
else
echo -e " V2ray Vless None Tls : "$red"not running (Error)"$NC" ❌"
fi
echo -e "${C}SERVIS XRAY${R}"
status="$(systemctl show xrayxtls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Xtls      : "$green"running"$NC" ✓"
else
echo -e " Xray Vless Xtls      : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show xrayvlesstls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Tls       : "$green"running"$NC" ✓"
else
echo -e " Xray Vless Tls       : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show xrayvlessnonetls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless None Tls  : "$green"running"$NC" ✓"
else
echo -e " Xray Vless None Tls  : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show xrayvlessgrpc.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Grpc      : "$green"running"$NC" ✓"
else
echo -e " Xray Vless Grpc      : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show xrayvmesstls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Tls       : "$green"running"$NC" ✓"
else
echo -e " Xray Vmess Tls       : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show xrayvmessnonetls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess None Tls  : "$green"running"$NC" ✓"
else
echo -e " Xray Vmess None Tls  : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show xrayvmessmkcp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Kcp       : "$green"running"$NC" ✓"
else
echo -e " Xray Vmess Kcp       : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show xrayvmessgrpc.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Grpc      : "$green"running"$NC" ✓"
else
echo -e " Xray Vmess Grpc      : "$red"not running (Error)"$NC" ❌"
fi
echo -e "${C}SERVIS TROJAN${R}"
status="$(systemctl show trojan --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Trojan         : "$green"running"$NC" ✓"
else
echo -e " V2ray Trojan         : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show xraytrojan --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Trojan          : "$green"running"$NC" ✓"
else
echo -e " Xray Trojan          : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show xraytrojangrpc --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Trojan Grpc     : "$green"running"$NC" ✓"
else
echo -e " Xray Trojan Grpc     : "$red"not running (Error)"$NC" ❌"
fi
echo -e "${C}SERVIS L2TP, SSTP & PPTP${R}"
status="$(systemctl show xl2tpd.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " L2TP                 : "$green"running"$NC" ✓"
else
echo -e " L2TP                 : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show pptpd.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " PPTP                 : "$green"running"$NC" ✓"
else
echo -e " PPTP                 : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show accel-ppp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSTP                 : "$green"running"$NC" ✓"
else
echo -e " SSTP                 : "$red"not running (Error)"$NC" ❌"
fi
echo -e "${C}SERVIS SSR, SHADOWSOCKS & NGINX${R}"
status="$(systemctl show ssrmu --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSR                  : "$green"running"$NC" ✓"
else
echo -e " SSR                  : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show shadowsocks-libev.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Shadowsocks          : "$green"running"$NC" ✓"
else
echo -e " Shadowsocks          : "$red"not running (Error)"$NC" ❌"
fi
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Nginx                : "$green"running"$NC" ✓"
else
echo -e " Nginx                : "$red"not running (Error)"$NC" ❌"
fi
echo -e "${C}SERVIS WIREGUARD${R}"
status="$(systemctl show wg-quick@wg0 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Wireguard            : "$green"running"$NC" ✓"
else
echo -e " Wireguard            : "$red"not running (Error)"$NC" ❌"
fi
echo ""
echo -e "${D}——————————————————————————————————————————${R}"