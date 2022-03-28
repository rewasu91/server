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

sqd="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | head -n1)"
sqd2="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | tail -n1)"

clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Menu Tukar Port Squid                   ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Tukar port $sqd"
echo -e "${B}[02]${R} ► Tukar port $sqd2"
echo -e "${B}[03]${R} ► Kembali ke Menu Utama"
echo -e "${B}[04]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-4]: " prot
echo -e ""
case $prot in
1)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                    Menukar Port Squid                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Squid: " squid1
if [ -z $squid1 ]; then
echo "► Sila masukkan port baru Squid"
exit 0
fi
cek=$(netstat -nutlp | grep -w $squid1)
if [[ -z $cek ]]; then
sed -i "s/$sqd/$squid1/g" /etc/squid/squid.conf
sed -i "s/   ► Squid                       :$sqd, $sqd2/   ► Squid                       :$squid1, $sqd2/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Maklumat Port Baru Squid                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Squid : $squid1 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $squid1 sudah digunakan. Sila masukkan port lain!"
fi
;;
2)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                    Menukar Port Squid                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Squid: " squid2
if [ -z $squid2 ]; then
echo "► Sila masukkan port baru Squid"
exit 0
fi
cek=$(netstat -nutlp | grep -w $squid2)
if [[ -z $cek ]]; then
sed -i "s/$sqd2/$squid2/g" /etc/squid/squid.conf
sed -i "s/   ► Squid                       :$sqd, $sqd2/   ► Squid                       :$sqd, $squid2g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Maklumat Port Baru Squid                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Squid : $squid2!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $squid2sudah digunakan. Sila masukkan port lain!"
fi
;;
3)
menu
;;
4)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
port-squid
;;
esac
