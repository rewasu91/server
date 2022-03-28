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

tls="$(cat /etc/xray/xrayvlesstls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')"
none="$(cat /etc/xray/xrayvlessnonetls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')"
xtls="$(cat /etc/xray/xrayxtls.json | grep port | sed 's/port//g' | sed 's/    "": //g' | sed 's/,//g' | sed 's/ //g')"

clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}               Menu Tukar Port Xray Vless                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Tukar port Xray Vless Tls $tls"
echo -e "${B}[02]${R} ► Tukar port Xray Vless None Tls $none"
echo -e "${B}[03]${R} ► Tukar port Xray Vless Xtls"
echo -e "${B}[04]${R} ► Kembali ke Menu Utama"
echo -e "${B}[05]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-5]: " prot
echo -e ""
case $prot in
1)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}              Menukar Port Xray Vless Tls                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Xray Vless Tls: " tls1
if [ -z $tls1 ]; then
echo "► Sila masukkan port baru Xray Vless Tls"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/xray/xrayvlesstls.json
sed -i "s/   ► Xray Vless Tcp Tls          :$tls/   ► Xray Vless Tcp Tls          :$tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xrayvlesstls.service > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}          Maklumat Port Baru Xray Vless Tls               ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Xray Vless Tls : $tls1 !"
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
echo -e "${D1}            Menukar Port Xray Vless None Tls              ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Xray Vless None Tls: " none1
if [ -z $none1 ]; then
echo "► Sila masukkan port baru Xray Vless None Tls"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/xray/xrayvlessnonetls.json
sed -i "s/   ► Xray Vless Tcp None Tls     :$none/   ► Xray Vless Tcp None Tls     :$none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xrayvlessnonetls.service > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}        Maklumat Port Baru Xray Vless None Tls            ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Xray Vless None Tls : $none1 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $none1 sudah digunakan. Sila masukkan port lain!"
fi
;;
3)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}              Menukar Port Xray Vless Xtls                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Xray Vless Xtls: " xtls1
if [ -z $xtls1 ]; then
echo "► Sila masukkan port baru Xray Vless Xtls"
exit 0
fi
cek=$(netstat -nutlp | grep -w $xtls1)
if [[ -z $cek ]]; then
sed -i "s/$xtls/$xtls1/g" /etc/xray/xrayxtls.json
sed -i "s/   ► Xray Vless Tcp Xtls Splice  :$xtls/   ► Xray Vless Tcp Xtls Splice  :$xtls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $xtls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $xtls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $xtls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $xtls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xrayxtls.service > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}          Maklumat Port Baru Xray Vless Xtls               ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Xray Vless Xtls : $xtls1 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $xtls1 sudah digunakan. Sila masukkan port lain!"
fi
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
port-xrayvless
;;
esac
