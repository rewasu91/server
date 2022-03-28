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

v2raytr=$(cat /etc/trojan/config.json | grep local_port | sed 's/local_//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/"//g' | sed 's/   //g' | sed 's/  //g')
xraytr=$(cat /etc/xray/xraytrojan.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/ //g')
trgo="$(cat /etc/trojan-go/config.json | grep local_port | sed 's/local_port//g' | sed 's/    "": //g' | sed 's/,//g')"
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
echo -e "${B}[01]${R} ► Tukar port V2ray Trojan $v2raytr"
echo -e "${B}[02]${R} ► Tukar port Xray Trojan $xraytr"
echo -e "${B}[03]${R} ► Tukar port Trojan Go $trgo"
echo -e "${B}[04]${R} ► Tukar port Xray Trojan Grpc $xraytrgrpc"
echo -e "${B}[05]${R} ► Kembali ke Menu Utama"
echo -e "${B}[06]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-6]: " prot
echo -e ""
case $prot in
1)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Menukar Port V2ray Trojan                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru V2ray Trojan: " v2raytr2
if [ -z $v2raytr2 ]; then
echo "► Sila masukkan port baru V2ray Trojan"
exit 0
fi
cek=$(netstat -nutlp | grep -w $v2raytr2)
if [[ -z $cek ]]; then
sed -i "s/$v2raytr/$v2raytr2/g" /etc/trojan/config.json
sed -i "s/   ► V2ray Trojan  		  :$v2raytr/   ► V2ray Trojan  		  :$v2raytr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $v2raytr -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $v2raytr -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $v2raytr2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $v2raytr2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}           Maklumat Port Baru V2ray Trojan                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru V2ray Trojan : $v2raytr2 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $v2raytr2 sudah digunakan. Sila masukkan port lain!"
fi
;;
2)
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
3)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Menukar Port Trojan Go                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru Trojan Go: " trgo2
if [ -z $trgo2 ]; then
echo "► Sila masukkan port baru Trojan Go"
exit 0
fi
cek=$(netstat -nutlp | grep -w $trgo2)
if [[ -z $cek ]]; then
sed -i "s/$trgo/$trgo2/g" /etc/trojan-go/config.json
sed -i "s/   ► Trojan Go                   :$trgo/   ► Trojan Go                   :$trgo2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $trgo -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $trgo -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $trgo2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $trgo2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan-go.service > /dev/null
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}             Maklumat Port Baru Trojan Go                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru Trojan Go : $trgo2 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $trgo2 sudah digunakan. Sila masukkan port lain!"
fi
;;
4)
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
5)
menu
;;
6)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
port-trgo
;;
esac
