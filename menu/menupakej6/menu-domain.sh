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
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                   Menu Sistem Domain                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${C}Untuk yang tiada akaun Cloudflare${R}"
echo -e "${B}[01]${R} ► Menambah / menukar domain"
echo -e ""
echo -e "${C}Untuk yang ada akaun Cloudflare${R}"
echo -e "${B}[02]${R} ► Menambah ID Cloudflare"
echo -e "${B}[03]${R} ► Menambah subdomain Cloudflare"
echo -e "${B}[04]${R} ► Pointing bug ke IP lain"
echo -e ""
echo -e "${C}Perbaharui certificate${R}"
echo -e "${B}[05]${R} ► Perbaharui certificate Xray"
echo -e "${B}[06]${R} ► Kembali ke Menu Utama"
echo -e "${B}[07]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-7]: " menudomain
echo -e ""
case $menudomain in
1)
add-host
;;
2)
add-cff
;;
3)
add-dom
;;
4)
add-cfh
;;
5)
certv2ray
;;
6)
menu
;;
7)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu-domain
;;
esac
