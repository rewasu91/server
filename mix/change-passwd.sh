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
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}         Mengganti Password Akaun SSH & OpenVPN           ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan Username yang akan diganti Passwordnya: " Login
egrep "^$Login" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "► Sila masukkan Password baru untuk user $username: " Pass
clear
egrep "^$Login" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass" | passwd $Login
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}       Maklumat Password Baru Akaun SSH & OpenVPN         ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "► Password untuk user ${C}$Login${R} sudah berjaya diganti."
echo -e "► Password baru untuk user ${C}$Login${R} adalah ${A}$Pass${R}"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo ""
else
echo -e "Username ${C}$Login${R} tidak dijumpai di VPS anda"
exit 0
fi
