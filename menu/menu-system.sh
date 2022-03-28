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
echo -e "${D1}                       Menu Sistem                        ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Menu sistem domain"
echo -e "${B}[02]${R} ► Menu tukar port servis"
echo -e "${B}[03]${R} ► Menu backup dan restore"
echo -e "${B}[04]${R} ► Menu Webmin"
echo -e "${B}[05]${R} ► Menu set autoreboot"
echo -e "${B}[06]${R} ► Limitkan kelajuan server"
echo -e "${B}[07]${R} ► Cek penggunaan ram VPS"
echo -e "${B}[08]${R} ► Speedtest VPS"
echo -e "${B}[09]${R} ► Menunjukkan maklumat sistem"
echo -e "${B}[10]${R} ► Menunjukkan maklumat autoskrip"
echo -e "${B}[11]${R} ► Menunjukkan status sistem"
echo -e "${B}[12]${R} ► Restart semua servis"
echo -e "${B}[13]${R} ► Reboot VPS"
echo -e "${B}[14]${R} ► Kembali ke Menu Utama"
echo -e "${B}[15]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-15]: " menusystem
echo -e ""
case $menusystem in
1)
menu-domain
;;
2)
menu-port
;;
3)
menu-backuprestore
;;
4)
menu-webmin
;;
5)
menu-autoreboot
;;
6)
limit-speed
;;
7)
ram
;;
8)
speedtest
;;
9)
info-system
;;
10)
info-script
;;
11)
running
;;
12)
restart
;;
13)
reboot
;;
14)
menu
;;
15)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu-system
;;
esac
