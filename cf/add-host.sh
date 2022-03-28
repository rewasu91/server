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
echo ""
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                   Menukar Domain                         ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo "► Adakah anda ingin menukar Domain anda?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) make install; break;;
        No ) exit;;
    esac
done
echo ""
read -p "► Sila masukkan Domain baru anda: " host
rm -f /var/lib/crot/ipvps.conf
rm -f /root/domain
rm -f /etc/xray/domain
mkdir /etc/xray
mkdir /var/lib/crot;
echo ""
read -p "► Sila masukkan Domain baru anda sekali lagi: " host
echo "IP=$host" >> /var/lib/crot/ipvps.conf
echo "$host" >> /etc/xray/domain
echo "$host" >> /root/domain
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Maklumat Domain Baru                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Domain   : $host"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
