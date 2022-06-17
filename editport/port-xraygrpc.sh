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

tls=$(cat /etc/xray/xrayvmessgrpc.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g' | sed 's/      //g')
none=$(cat /etc/xray/xrayvlessgrpc.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g' | sed 's/      //g')

clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Menu Tukar Port Xray Grpc                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Tukar port Xray Vmess Grpc $tls"
echo -e "${B}[02]${R} ► Tukar port Xray Vless Grpc $none"
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
echo -e "${D1}              Menukar Port Xray Vmess Grpc                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Xray Vmess Grpc: " tls1
if [ -z $tls1 ]; then
echo "► Sila masukkan port baru Xray Vmess Grpc"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/ $tls/$tls1/g" /etc/xray/xrayvmessgrpc.json
sed -i "s/   ► Xray Vmess Grpc             :$tls/   ► Xray Vmess Grpc             :$tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xrayvmessgrpc.service > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}          Maklumat Port Baru Xray Vmess Grpc              ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Xray Vmess Grpc : $tls1 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $tls1 sudah digunakan. Sila masukkan port lain!"
fi
;;
2)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}              Menukar Port Xray Vless Grpc                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Xray Vless Grpc: " $none1
if [ -z $none1 ]; then
echo "► Sila masukkan port baru Xray Vless Grpc"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/ $none/$none1/g" /etc/xray/xrayvlessgrpc.json
sed -i "s/   ► Xray Vless Grpc             :$none/   ► Xray Vless Grpc             :$none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xrayvlessgrpc.service > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}          Maklumat Port Baru Xray Vless Grpc              ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Xray Vless Grpc : $none1 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $none1 sudah digunakan. Sila masukkan port lain!"
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
port-xraygrpc
;;
esac
