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

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[Installed]${Font_color_suffix}"
Error="${Red_font_prefix}[Not Installed]${Font_color_suffix}"
cek=$(netstat -ntlp | grep 10000 | awk '{print $7}' | cut -d'/' -f2)

function install () {
IP=$(wget -qO- ifconfig.co);
echo " Adding Repositori Webmin"
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
apt install gnupg gnupg1 gnupg2 -y
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
echo " Start Install Webmin"
clear
sleep 0.5
apt update > /dev/null 2>&1
apt install webmin -y
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
/etc/init.d/webmin restart
rm -f /root/jcameron-key.asc
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                     Maklumat Webmin                      ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Webmin berjaya dipasang!"
echo -e "► Link Webmin : $IP:10000"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
}
function restart () {
echo " Restarting Webmin"
sleep 0.5
service webmin restart > /dev/null 2>&1
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                     Maklumat Webmin                      ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Webmin berjaya direstart!"
echo -e "► Link Webmin : $IP:10000"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
}
function uninstall () {
echo " Removing Repositori Webmin"
rm -f /etc/apt/sources.list.d/webmin.list
apt update > /dev/null 2>&1
echo " Start Uninstall Webmin"
clear
sleep 0.5
apt autoremove --purge webmin -y > /dev/null 2>&1
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                     Maklumat Webmin                      ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Webmin berjaya dibuang!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
}
if [[ "$cek" = "perl" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                       Menu Webmin                        ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "► Webmin Status: $sts"
echo -e "${B}[01]${R} ► Install Webmin"
echo -e "${B}[02]${R} ► Restart Webmin"
echo -e "${B}[03]${R} ► Uninstall Webmin"
echo -e "${B}[04]${R} ► Kembali ke Menu Utama"
echo -e "${B}[05]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -rp "     ► Sila masukkan nombor pilihan anda [1-5]: " -e num
echo -e ""
if [[ "$num" = "1" ]]; then
install
elif [[ "$num" = "2" ]]; then
restart
elif [[ "$num" = "3" ]]; then
uninstall
elif [[ "$num" = "3" ]]; then
menu
elif [[ "$num" = "5" ]]; then
clear
cd
else
clear
echo " Sila masukkan nombor yang betul!"
menu-webmin
fi
