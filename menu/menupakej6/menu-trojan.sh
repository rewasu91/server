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
echo -e "${D1}                        Menu Trojan                       ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "Xray Trojan"
echo -e "${B}[01]${R} ► Membuat akaun Xray Trojan"
echo -e "${B}[02]${R} ► Memadam akaun Xray Trojan"
echo -e "${B}[03]${R} ► Menambah masa aktif akaun Xray Trojan"
echo -e "${B}[04]${R} ► Cek user login akaun Xray Xray Trojan"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "Xray Trojan Grpc"
echo -e "${B}[05]${R} ► Membuat akaun Xray Trojan Grpc"
echo -e "${B}[06]${R} ► Memadam akaun Xray Trojan Grpc"
echo -e "${B}[07]${R} ► Menambah masa aktif akaun Xray Trojan Grpc"
echo -e "${B}[08]${R} ► Cek user login akaun Xray Xray Trojan Grpc"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "Lain-lain"
echo -e "${B}[09]${R} ► Kembali ke Menu Utama"
echo -e "${B}[10]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-10]: " menutrojan
echo -e ""

case $menutrojan in
1)
add-xraytrojan
;;
2)
del-xraytrojan
;;
3)
renew-xraytrojan
;;
4)
cek-xraytrojan
;;
5)
add-xraytrojangrpc
;;
6)
del-xraytrojangrpc
;;
7)
renew-xraytrojangrpc
;;
8)
cek-xraytrojangrpc
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
menu-trojan
;;
esac
