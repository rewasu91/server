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

IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d")
email=$(cat /home/email)

clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}               Backup Fail Melalui Email                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
if [[ "$email" = "" ]]; then
read -rp " ► Sila masukkan Email untuk menerima fail backup: " -e email
cat <<EOF>>/home/email
$email
EOF
fi
clear
echo -e ""
sleep 1
echo Membuat Directory
rm -rf /root/backup
mkdir /root/backup
sleep 1
echo Start Backup
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/ipsec.d/passwd backup/passwd1
cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
cp -r /var/lib/crot/ backup/crot
cp -r /home/sstp backup/sstp
cp -r /etc/xray backup/xray
cp -r /etc/trojan-go backup/trojan-go
cp -r /usr/local/shadowsocksr/ backup/shadowsocksr
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}          Maklumat Backup Fail Melalui Email              ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Fail backup telah dihantar. Sila cek email anda!
echo -e "► Sila copy link dibawah, paste di menu restore!
echo -e "► Link Backup : $link"
echo -e "${D}——————————————————————————————————————————————————————————${R}" | mail -s "Backup Data" $email
echo -e ""
rm -rf /root/backup
rm -r /root/$IP-$date.zip
