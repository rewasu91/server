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
echo -e "${D1}                   Menu Shadowsock OBFS                   ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Membuat akaun Shadowsock"
echo -e "${B}[02]${R} ► Memadam akaun Shadowsock"
echo -e "${B}[03]${R} ► Menambah masa aktif akaun Shadowsock"
echo -e "${B}[04]${R} ► Cek user login akaun Shadowsock"
echo -e "${B}[05]${R} ► Kembali ke Menu Utama"
echo -e "${B}[06]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-6]: " menuss
echo -e ""
case $menuss in
1)
add-ss
;;
2)
del-ss
;;
3)
renew-ss
;;
4)
cek-ss
;;
5)
menu
;;
6)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu-ss
;;
esac
