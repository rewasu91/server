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

xraytr=$(cat /etc/xray/xraytrojan.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/ //g')
xraytrgrpc=$(cat /etc/xray/xraytrojangrpc.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/ //g')


clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Menu Tukar Port Trojan                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Tukar port Xray Trojan $xraytr"
echo -e "${B}[02]${R} ► Tukar port Xray Trojan Grpc $xraytrgrpc"
echo -e "${B}[03]${R} ► Kembali ke Menu Utama"
echo -e "${B}[04]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-4]: " prot
echo -e ""
case $prot in
1)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                 Menukar Port Xray Trojan                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Xray Trojan: " xraytr2
if [ -z $xraytr2 ]; then
echo "► Sila masukkan port baru Xray Trojan"
exit 0
fi
cek=$(netstat -nutlp | grep -w $xraytr2)
if [[ -z $cek ]]; then
sed -i "s/$xraytr/$xraytr2/g" /etc/xray/trojan.json
sed -i "s/   ► Xray Trojan                 :$xraytr/   ► Xray Trojan                 :$xraytr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $xraytr -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $xraytr -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $xraytr2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $xraytr2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xraytrojan.service > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}            Maklumat Port Baru Xray Trojan                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Xray Trojan : $xraytr2 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $xraytr2 sudah digunakan. Sila masukkan port lain!"
fi
;;
2)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}              Menukar Port Xray Trojan Grpc               ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Xray Trojan Grpc: " xraytrgrpc2
if [ -z $xraytrgrpc2 ]; then
echo "► Sila masukkan port baru Xray Trojan Grpc"
exit 0
fi
cek=$(netstat -nutlp | grep -w $xraytrgrpc2)
if [[ -z $cek ]]; then
sed -i "s/$xraytrgrpc/$xraytrgrpc2/g"  /etc/xray/xraytrojangrpc.json
sed -i "s/   ► Xray Trojan Grpc            :$xraytrgrpc/   ► Xray Trojan Grpc            :$xraytrgrpc2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $xraytrgrpc -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $xraytrgrpc -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $xraytrgrpc2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $xraytrgrpc2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xraytrojangrpc.service > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}          Maklumat Port Baru Xray Trojan Grpc             ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Xray Trojan Grpc : $xraytrgrpc2 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $xraytrgrpc2 sudah digunakan. Sila masukkan port lain!"
fi
;;
3)
menu
;;
4)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
port-trojan3
;;
esac
