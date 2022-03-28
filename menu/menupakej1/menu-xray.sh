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
echo -e "${D1}                         Menu Xray                        ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "Xray Xtls"
echo -e "${B}[01]${R} ► Membuat akaun Xray Xtls"
echo -e "${B}[02]${R} ► Memadam akaun Xray Xtls"
echo -e "${B}[03]${R} ► Menambah masa aktif akaun Xray Xtls"
echo -e "${B}[04]${R} ► Cek user login akaun Xray Xtls"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"c
echo -e "Xray Vless"
echo -e "${B}[05]${R} ► Membuat akaun Xray Vless"
echo -e "${B}[06]${R} ► Memadam akaun Xray Vless"
echo -e "${B}[07]${R} ► Menambah masa aktif akaun Xray Vless"
echo -e "${B}[08]${R} ► Cek user login akaun Xray Vless"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "Xray Vmess"
echo -e "${B}[09]${R} ► Membuat akaun Xray Vmess"
echo -e "${B}[10]${R} ► Memadam akaun Xray Vmess"
echo -e "${B}[11]${R} ► Menambah masa aktif akaun Xray Vmess"
echo -e "${B}[12]${R} ► Cek user login akaun Xray Vmess"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "Xray Grpc"
echo -e "${B}[13]${R} ► Membuat akaun Xray Grpc"
echo -e "${B}[14]${R} ► Memadam akaun Xray Grpc"
echo -e "${B}[15]${R} ► Menambah masa aktif akaun Xray Grpc"
echo -e "${B}[16]${R} ► Cek user login akaun Xray Grpc"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "Lain-lain"
echo -e "${B}[17]${R} ► Kembali ke Menu Utama"
echo -e "${B}[18]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-18]: " menuxray
echo -e ""

case $menuxray in
1)
add-xrayxtls
;;
2)
del-xrayxtls
;;
3)
renew-xrayxtls
;;
4)
cek-xrayxtls
;;
5)
add-xrayvless
;;
6)
del-xrayvless
;;
7)
renew-xrayvless
;;
8)
cek-xrayvless
;;
9)
add-xrayvmess
;;
10)
del-xrayvmess
;;
11)
renew-xrayvmess
;;
12)
cek-xrayvmess
;;
13)
add-xraygrpc
;;
14)
del-xraygrpc
;;
15)
renew-xraygrpc
;;
16)
cek-xraygrpc
;;
17)
menu
;;
18)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu-xray
;;
esac
