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
echo -e "${D1}                 Menu Backup Dan Restore                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Backup menggunakan Email"
echo -e "${B}[02]${R} ► Autobackup menggunakan Email"
echo -e "${B}[03]${R} ► Restore menggunakan Email"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${B}[04]${R} ► Backup menggunakan Nginx"
echo -e "${B}[05]${R} ► Autobackup menggunakan Nginx"
echo -e "${B}[06]${R} ► Restore menggunakan Nginx"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${B}[07]${R} ► Kembali ke Menu Utama"
echo -e "${B}[08]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-8]: " menubackuprestore
echo -e ""
case $menubackuprestore in
1)
backupemail
;;
2)
autobackupemail
;;
3)
restoreemail
;;
4)
backupnginx
;;
5)
autobackupnginx
;;
6)
restorenginx
;;
7)
menu
;;
8)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu-backuprestore
;;
esac
