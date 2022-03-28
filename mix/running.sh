#!/bin/bash
red="\e[1;31m"
green="\e[0;32m"
NC="\e[0m"
clear
echo "          ┃ RUNNING MENU ┃        "
echo " ************************** "
echo ""
status="$(systemctl show ssh.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSH                  : SSH Service is "$green"running"$NC""
else
echo -e " SSH                  : SSH Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show openvpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Openvpn              : Openvpn Service is "$green"running"$NC""
else
echo -e " Openvpn              : Openvpn Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show stunnel4.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Stunnel4             : Stunnel4 Service is "$green"running"$NC""
else
echo -e " Stunnel4             : Stunnel4 Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Dropbear             : Dropbear Service is "$green"running"$NC""
else
echo -e " Dropbear             : Dropbear Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show squid.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Squid                : Squid Service is "$green"running"$NC""
else
echo -e " Squid                : Squid Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show ws-stunnel.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " WebSocket TLS        : WebSocket TLS Service is "$green"running"$NC""
else
echo -e " WebSocket TLS        : WebSocket TLS Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show websocket.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " WebSocket None TLS   : WebSocket None TLS Service is "$green"running"$NC""
else
echo -e " WebSocket None TLS   : WebSocket None TLS Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show ws-ovpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " WebSocket OpenVPN    : WebSocket OpenVPN Service is "$green"running"$NC""
else
echo -e " WebSocket OpenVPN    : WebSocket OpenVPN Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show ssh-ohp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OHP OpenSSH          : OHP OpenSSH is "$green"running"$NC""
else
echo -e " OHP OpenSSH          : OHP OpenSSH is "$red"not running (Error)"$NC""
fi
status="$(systemctl show openvpn-ohp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OHP OpenVPN          : OHP OpenVPN is "$green"running"$NC""
else
echo -e " OHP OpenVPN          : OHP OpenVPN is "$red"not running (Error)"$NC""
fi
status="$(systemctl show dropbear-ohp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OHP Dropbear         : OHP Dropbear is "$green"running"$NC""
else
echo -e " OHP Dropbear         : OHP Dropbear is "$red"not running (Error)"$NC""
fi
status="$(systemctl show wg-quick@wg0 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Wireguard            : Wireguard Service is "$green"running"$NC""
else
echo -e " Wireguard            : Wireguard Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Vmess Tls      : V2ray Vmess Tls Service is "$green"running"$NC""
else
echo -e " V2ray Vmess Tls      : V2ray Vmess Tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Vmess None Tls : V2ray Vmess None Tls Service is "$green"running"$NC""
else
echo -e " V2ray Vmess None Tls : V2ray Vmess None Tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray@vless.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Vless Tls      : V2ray Vless Tls Service is "$green"running"$NC""
else
echo -e " V2ray Vless Tls      : V2ray Vless Tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray@vnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Vless None Tls : V2ray Vless None Tls Service is "$green"running"$NC""
else
echo -e " V2ray Vless None Tls : V2ray Vless None Tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xrayxtls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Xtls      : Xray Vless Xtls Service is "$green"running"$NC""
else
echo -e " Xray Vless Xtls      : Xray Vless Xtls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xrayvlesstls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Tls       : Xray Vless Tls Service is "$green"running"$NC""
else
echo -e " Xray Vless Tls       : Xray Vless Tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xrayvlessnonetls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless None Tls  : Xray Vless None Tls Service is "$green"running"$NC""
else
echo -e " Xray Vless None Tls  : Xray Vless None Tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xrayvlessgrpc.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Grpc      : Xray Vless Grpc Service is "$green"running"$NC""
else
echo -e " Xray Vless Grpc      : Xray Vless Grpc Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xrayvmesstls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Tls       : Xray Vmess Tls Service is "$green"running"$NC""
else
echo -e " Xray Vmess Tls       : Xray Vmess Tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xrayvmessnonetls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess None Tls  : Xray Vmess None Tls Service is "$green"running"$NC""
else
echo -e " Xray Vmess None Tls  : Xray Vmess None Tls Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xrayvmessmkcp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Kcp       : Xray Vmess Kcp Service is "$green"running"$NC""
else
echo -e " Xray Vmess Kcp       : Xray Vmess Kcp Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xrayvmessgrpc.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Grpc      : Xray Vmess Grpc Service is "$green"running"$NC""
else
echo -e " Xray Vmess Grpc      : Xray Vmess Grpc Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show trojan-go.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Trojan Go            : Trojan Go Service is "$green"running"$NC""
else
echo -e " Trojan Go            : Trojan Go Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show trojan --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Trojan         : V2ray Trojan Service is "$green"running"$NC""
else
echo -e " V2ray Trojan         : V2ray Trojan Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xraytrojan --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Trojan          : Xray Trojan Service is "$green"running"$NC""
else
echo -e " Xray Trojan          : Xray Trojan Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xraytrojangrpc --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Trojan Grpc     : Xray Trojan Grpc Service is "$green"running"$NC""
else
echo -e " Xray Trojan Grpc     : Xray Trojan Grpc Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show xl2tpd.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " L2TP                 : L2TP is "$green"running"$NC""
else
echo -e " L2TP                 : L2TP is "$red"not running (Error)"$NC""
fi
status="$(systemctl show pptpd.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " PPTP                 : PPTP is "$green"running"$NC""
else
echo -e " PPTP                 : PPTP is "$red"not running (Error)"$NC""
fi
status="$(systemctl show accel-ppp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSTP                 : SSTP is "$green"running"$NC""
else
echo -e " SSTP                 : SSTP is "$red"not running (Error)"$NC""
fi
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Nginx                : Nginx Service is "$green"running"$NC""
else
echo -e " Nginx                : Nginx Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show ssrmu --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSR                  : SSR Service is "$green"running"$NC""
else
echo -e " SSR                  : SSR Service is "$red"not running (Error)"$NC""
fi
status="$(systemctl show shadowsocks-libev.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Shadowsocks          : Shadowsocks Service is "$green"running"$NC""
else
echo -e " Shadowsocks          : Shadowsocks Service is "$red"not running (Error)"$NC""
fi
