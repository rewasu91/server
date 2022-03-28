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
echo -e "${D1}                     Tukar Style Menu                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Menu Style 1 (12 Sub Menu)"
echo -e "${B}[02]${R} ► Menu Style 2 (26 Sub Menu)"
echo -e "${B}[03]${R} ► Menu Style 3 (109 Sub Menu)"
echo -e "${B}[04]${R} ► Kembali ke Menu Utama"
echo -e "${B}[05]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-5]: " changemenustyle
echo -e ""
case $changemenustyle in
1)
clear
cd /usr/bin
rm menu
wget -O menu "https://raw.githubusercontent.com/rewasu91/public/main/menu/menupakej5/menu1.sh"
chmod +x menu
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                    Menukar Style Menu                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
sleep 2
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                     Tukar Style Menu                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}► Anda telah berjaya menukar style menu anda.${R}"
echo -e "${B}► Sila taip menu untuk melihat style menu terbaru anda!${R}"
echo -e ""
echo -e ""
;;
2)
clear
cd /usr/bin
rm menu
wget -O menu "https://raw.githubusercontent.com/rewasu91/public/main/menu/menupakej5/menu2.sh"
chmod +x menu
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                    Menukar Style Menu                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
sleep 2
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                     Tukar Style Menu                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}► Anda telah berjaya menukar style menu anda.${R}"
echo -e "${B}► Sila taip menu untuk melihat style menu terbaru anda!${R}"
echo -e ""
echo -e ""
;;
3)
clear
cd /usr/bin
rm menu
wget -O menu "https://raw.githubusercontent.com/rewasu91/public/main/menu/menupakej5/menu3.sh"
chmod +x menu
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                    Menukar Style Menu                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
sleep 2
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                     Tukar Style Menu                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}► Anda telah berjaya menukar style menu anda.${R}"
echo -e "${B}► Sila taip menu untuk melihat style menu terbaru anda!${R}"
echo -e ""
echo -e ""
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
menu-changemenu
;;
esac
