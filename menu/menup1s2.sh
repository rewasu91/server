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

clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
domain=$(cat /etc/v2ray/domain)
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
echo -e "* MASA     : $jam"
echo -e "* HARI     : $hari"
echo -e "* TARIKH   : $tnggl"
echo -e "* TIMEZONE : $WKT"
echo -e "* SERVER   : $ISP"
echo -e "* BANDAR   : $CITY"
echo -e "* IP VPS   : $IPVPS"
echo -e "* DOMAIN   : ${domain}"
echo -e ""
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
echo -e "${D1}                   Senarai Servis & Protokol                    ${R}"
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "      ${B}[01]${R} ► Menu SSH & OVPN     ${B}[06]${R} ► Menu SHADOWSOCKS      "
echo -e "      ${B}[02]${R} ► Menu L2TP           ${B}[07]${R} ► Menu WIREGUARD        "
echo -e "      ${B}[03]${R} ► Menu SSTP           ${B}[08]${R} ► Menu V2RAY CORE       "
echo -e "      ${B}[04]${R} ► Menu PPTP           ${B}[09]${R} ► Menu XRAY CORE        "
echo -e "      ${B}[05]${R} ► Menu SSR            ${B}[10]${R} ► Menu TROJAN           "
echo -e ""
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[11]${R} ► Menu sistem domain"
echo -e "${B}[12]${R} ► Menu tukar port servis"
echo -e "${B}[13]${R} ► Menu backup dan restore"
echo -e "${B}[14]${R} ► Menu Webmin"
echo -e "${B}[15]${R} ► Menu set autoreboot"
echo -e "${B}[16]${R} ► Limitkan kelajuan server"
echo -e "${B}[17]${R} ► Cek penggunaan ram VPS"
echo -e "${B}[18]${R} ► Speedtest VPS"
echo -e "${B}[19]${R} ► Menunjukkan maklumat sistem"
echo -e "${B}[20]${R} ► Menunjukkan maklumat autoskrip"
echo -e "${B}[21]${R} ► Menunjukkan status sistem"
echo -e "${B}[22]${R} ► Restart semua servis"
echo -e "${B}[23]${R} ► Reboot VPS"
echo -e "${B}[24]${R} ► Menu UPDATE"
echo -e "${B}[25]${R} ► Tukar STYLE MENU"
echo -e "${B}[26]${R} ► Kembali ke Menu Utama"
echo -e "${B}[27]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"

read -p "► Sila masukkan nombor pilihan anda [1-27]: " menu
echo -e ""
case $menu in
1)
menu-sshvpn
;;
2)
menu-l2tp
;;
3)
menu-sstp
;;
4)
menu-pptp
;;
5)
menu-ssr
;;
6)
menu-ss
;;
7)
menu-wg
;;
8)
menu-v2ray
;;
9)
menu-xray
;;
10)
menu-trojan
;;
11)
menu-domain
;;
12)
menu-port
;;
13)
menu-backuprestore
;;
14)
menu-webmin
;;
15)
menu-autoreboot
;;
16)
limit-speed
;;
17)
ram
;;
18)
speedtest
;;
19)
info-system
;;
20)
info-script
;;
21)
running
;;
22)
restart
;;
23)
reboot
;;
24)
update
;;
25)
menu-changemenu
;;
26)
menu
;;
27)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu
;;
esac
