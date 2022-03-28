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
echo -e "${D1}                         Menu V2ray                       ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "V2ray Vless"
echo -e "${B}[01]${R} ► Membuat akaun V2ray Vless"
echo -e "${B}[02]${R} ► Memadam akaun V2ray Vless"
echo -e "${B}[03]${R} ► Menambah masa aktif akaun V2ray Vless"
echo -e "${B}[04]${R} ► Cek user login akaun V2ray Vless"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "V2ray Vmess"
echo -e "${B}[05]${R} ► Membuat akaun V2ray Vmess"
echo -e "${B}[06]${R} ► Memadam akaun V2ray Vmess"
echo -e "${B}[07]${R} ► Menambah masa aktif akaun V2ray Vmess"
echo -e "${B}[08]${R} ► Cek user login akaun V2ray Vmess"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "Lain-lain"
echo -e "${B}[09]${R} ► Kembali ke Menu Utama"
echo -e "${B}[10]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-10]: " menuv2ray
echo -e ""

case $menuv2ray in
1)
add-v2rayvless
;;
2)
del-v2rayvless
;;
3)
renew-v2rayvless
;;
4)
cek-v2rayvless
;;
5)
add-v2rayvmess
;;
6)
del-v2rayvmess
;;
7)
renew-v2rayvmess
;;
8)
cek-v2rayvmess
;;
9)
menu
;;
10)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu-v2ray
;;
esac
