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
echo -e "${D1}                    Menu SSH & OpenVPN                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Membuat akaun SSH & OpenVPN"
echo -e "${B}[02]${R} ► Membuat akaun percubaan SSH & OpenVPN"
echo -e "${B}[03]${R} ► Mengganti password akaun SSH & OpenVPN"
echo -e "${B}[04]${R} ► Senarai akaun SSH & OpenVPN"
echo -e "${B}[05]${R} ► Senarai login akaun SSH & OpenVPN"
echo -e "${B}[06]${R} ► Menambah masa aktif akaun SSH & OpenVPN Account"
echo -e "${B}[07]${R} ► Memadam akaun SSH & OpenVPN Account"
echo -e "${B}[08]${R} ► Memadam akaun SSH & OpenVPN yang sudah tamat tempoh"
echo -e "${B}[09]${R} ► Setup Autokill SSH"
echo -e "${B}[10]${R} ► Menunjukkan akaun yang melakukan Multi Login"
echo -e "${B}[11]${R} ► Restart servis Dropbear, Squid3, OpenVPN dan SSH"
echo -e "${B}[12]${R} ► Kembali ke Menu Utama"
echo -e "${B}[13]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-13]: " menussh
echo -e ""
case $menussh in
1)
add-sshvpn
;;
2)
add-trial
;;
3)
change-passwd
;;
4)
cek-listmember
;;
5)
cek-login
;;
6)
renew-sshvpn
;;
7)
del-sshvpn
;;
8)
del-expiresshvpn
;;
9)
autokill
;;
10)
cek-lim 
;;
11) 
restartsshvpn
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
menu-sshvpn
;;
esac
