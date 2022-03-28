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

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
MYIP=$(curl -sS ipv4.icanhazip.com)

clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}             Perbaharui Akaun SSH & OpenVPN               ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan Username yang ingin diperbaharui :  " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "► Tambah berapa hari? :  " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}   Maklumat Akaun SSH & OpenVPN Yang Sudah Diperbaharui   ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Username                   :  $User"
echo -e "► Jumlah hari yang ditambah  :  $Days Hari"
echo -e "► Expire pada                :  $Expiration_Display"
echo -e "✅ Akaun berjaya diperbaharui, terima kasih!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
else
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}          Username Tidak Ada Didalam Sistem VPS           ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
fi
