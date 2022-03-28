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
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Menu Tukar Port Servis                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Tukar port OpenVPN"
echo -e "${B}[02]${R} ► Tukar port Stunnel4"
echo -e "${B}[03]${R} ► Tukar port Squid"
echo -e "${B}[04]${R} ► Tukar port SSTP"
echo -e "${B}[05]${R} ► Tukar port Wireguard"
echo -e "${B}[06]${R} ► Tukar port V2ray Vless"
echo -e "${B}[07]${R} ► Tukar port V2ray Vmess"
echo -e "${B}[08]${R} ► Tukar port Xray Vless"
echo -e "${B}[09]${R} ► Tukar port Xray Vmess"
echo -e "${B}[10]${R} ► Tukar port Xray Grpc"
echo -e "${B}[11]${R} ► Tukar port Trojan"
echo -e "${B}[12]${R} ► Kembali ke Menu Utama"
echo -e "${B}[13]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-13]: " menuport
echo -e ""
case $menuport in
1)
port-ovpn
;;
1)
port-stunnel4
;;
3)
port-squid
;;
4)
port-sstp
;;
5)
port-wg
;;
6)
port-v2rayvless
;;
7)
port-v2rayvmess
;;
8)
port-xrayvless
;;
9)
port-xrayvmess
;;
10)
port-xraygrpc
;;
11)
port-trojan
;;
12)
menu
;;
13)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu-port
;;
esac
