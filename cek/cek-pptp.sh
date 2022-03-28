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

clear
echo -e ""
echo -e ""
last | grep ppp | grep still | awk '{print " ",$1," - " $3 }' > /tmp/login-db-pptp.txt;
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Senarai Login User PPTP                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo "Username   ---   IP";
echo -e "${D}——————————————————————————————————————————————————————————${R}"
cat /tmp/login-db-pptp.txt
echo ""
echo ""
echo ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo "";
