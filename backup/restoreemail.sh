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
echo -e "${D1}              Restore Fail Melalui Email                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -rp " ► Sila masukkan link backup fail: " -e url
echo -e ""
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
cp -r wireguard /etc/
cp chap-secrets /etc/ppp/
cp passwd1 /etc/ipsec.d/passwd
cp ss.conf /etc/shadowsocks-libev/akun.conf
cp -r crot-script /var/lib/
cp -r premium-script /var/lib/
cp -r sstp /home/sstp
cp -r v2ray /etc/
cp -r xray /etc/
cp -r trojan /etc/
cp -r trojan-go /etc/
cp -r shadowsocksr /usr/local/
cp -r public_html /home/vps/
strt
rm -rf /root/backup
rm -f backup.zip
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}          Maklumat Restore Fail Melalui Email             ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Fail backup telah berjaya direstore! Sila cek sistem anda!
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
