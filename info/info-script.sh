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
echo -e "     ${D}—————————————————————————————————————————————————————————${R}"
echo -e "     ${D1}*             Autoskrip VPS Premium KaizenVPN           *${R}"
echo -e "     ${D}—————————————————————————————————————————————————————————${R}"
echo -e "     ${D}*            Dibuat & Diubahsuai oleh KaizenVPN         *${R}"
echo -e "     ${D}*            Untuk Debian 9 & Debian 10 64 bit          *${R}"
echo -e "     ${D}*        Untuk Ubuntu 18.04 & Ubuntu 20.04 64 bit       *${R}"
echo -e "     ${D}*          Untuk VPS sistem jenis KVM dan VMWare        *${R}"
echo -e "     ${D}*                    Telegram: @KaizenA                 *${R}"
echo -e "     ${D}—————————————————————————————————————————————————————————${R}"
echo -e ""
