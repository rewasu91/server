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

ssl="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $1}')"
ssl2="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $2}')"
ssl3="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $3}')"

clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                 Menu Tukar Port Stunnel4                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Tukar port $ssl"
echo -e "${B}[02]${R} ► Tukar port $ssl2"
echo -e "${B}[03]${R} ► Tukar port $ssl3"
echo -e "${B}[04]${R} ► Kembali ke Menu Utama"
echo -e "${B}[05]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-5]: " prot
echo -e ""
case $prot in
1)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                 Menukar Port Stunnel4                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Stunnel4: " stl
if [ -z $stl ]; then
echo "► Sila masukkan port baru Stunnel4"
exit 0
fi
cek=$(netstat -nutlp | grep -w $stl)
if [[ -z $cek ]]; then
sed -i "s/$ssl/$stl/g" /etc/stunnel/stunnel.conf
sed -i "s/"   ► Stunnel4                    :$ssl, $ssl2, $ssl3/"   ► Stunnel4                    :$stl, $ssl2, $ssl3/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}             Maklumat Port Baru Stunnel4                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Stunnel4 : $stl !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $stl sudah digunakan. Sila masukkan port lain!" 
fi
;;
2)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                 Menukar Port Stunnel4                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Stunnel4: " stl2
if [ -z $stl2 ]; then
echo "► Sila masukkan port baru Stunnel4"
exit 0
fi
cek=$(netstat -nutlp | grep -w $stl2)
if [[ -z $cek ]]; then
sed -i "s/$ssl2/$stl2/g" /etc/stunnel/stunnel.conf
sed -i "s/   ► Stunnel4                    :$ssl, $ssl2, $ssl3/   ► Stunnel4                    :$ssl, $stl2, $ssl3/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}             Maklumat Port Baru Stunnel4                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Stunnel4 : $stl2 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $stl2 sudah digunakan. Sila masukkan port lain!" 
fi
;;
3)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                 Menukar Port Stunnel4                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Stunnel4: " stl3
if [ -z $stl3 ]; then
echo "► Sila masukkan port baru Stunnel4"
exit 0
fi
cek=$(netstat -nutlp | grep -w $stl3)
if [[ -z $cek ]]; then
sed -i "s/$ssl3/$stl3/g" /etc/stunnel/stunnel.conf
sed -i "s/   ► Stunnel4                    :$ssl, $ssl2, $ssl3/   ► Stunnel4                    :$ssl, $ssl2, $stl3/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}             Maklumat Port Baru Stunnel4                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Stunnel4 : $stl3 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $stl3 sudah digunakan. Sila masukkan port lain!" 
fi
;;
4)
menu
;;
5)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
port-stunnel4
;;
esac
