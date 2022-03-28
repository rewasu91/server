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

wg="$(cat ~/log-install.txt | grep -w "► Wireguard" | cut -d: -f2|sed 's/ //g')"

clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}               Menu Tukar Port Wireguard                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Tukar port $wg"
echo -e "${B}[02]${R} ► Kembali ke Menu Utama"
echo -e "${B}[03]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-3]: " prot
echo -e ""
case $prot in
1)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                 Menukar Port Wireguard                   ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Wireguard: " wg2
if [ -z $wg2 ]; then
echo "► Sila masukkan port baru Wireguard"
exit 0
fi
cek=$(netstat -nutlp | grep -w $wg2)
if [[ -z $cek ]]; then
sed -i "s/$wg/$wg2/g" /etc/wireguard/wg0.conf
sed -i "s/$wg/$wg2/g" /etc/wireguard/params
sed -i "s/   ► Wireguard                   :$wg/   ► Wireguard                   :$wg2/g" /root/log-install.txt
iptables -D INPUT -i $NIC -p udp --dport $wg -j ACCEPT
iptables -I INPUT -i $NIC -p udp --dport $wg2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl reload wg-quick@wg0 > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}              Maklumat Port Baru Wireguard                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Wireguard : $wg2 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $wg2 sudah digunakan. Sila masukkan port lain!"
fi
;;
2)
menu
;;
3)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
port-wg
;;
esac
