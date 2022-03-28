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
cd /root
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Membuat ID Cloudflare                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -e -p "► Sila masukan Domain :$host" host
rm -f /var/lib/crot/ipvps.conf
rm -f /root/domain
rm -f /etc/xray/domain
rm -f /root/mail.conf
mkdir /etc/xray
mkdir /var/lib/crot;
echo ""
read -e -p "► Sila masukan Domain anda sekali lagi :$host" host
echo "IP=$host" >> /var/lib/crot/ipvps.conf
echo "$host" >> /etc/xray/domain
echo "$host" >> /root/domain
read -e -p "► Sila masukan Email Cloudflare :" email
read -e -p "► Sila masukan Api Key :" key
echo -e ""
echo -e "email=$email" >> /root/mail.conf
echo -e "key=$key" >> /root/mail.conf
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                 Maklumat ID Cloudflare                   ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Domain   : $host"
echo -e "► Email    : $email"
echo -e "► Api Key  : $key"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
