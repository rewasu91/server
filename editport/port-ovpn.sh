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
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                 Menu Tukar Port OpenVPN                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Tukar port TCP $ovpn"
echo -e "${B}[02]${R} ► Tukar port UDP $ovpn2"
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
echo -e "${D1}               Menukar Port OpenVPN TCP                   ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru OpenVPN TCP: " vpn1
if [ -z $vpn1 ]; then
echo "► Sila masukkan port baru OpenVPN TCP"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/openvpn/server/server-tcp-$ovpn.conf
rm -f /etc/openvpn/client-tcp-$ovpn.ovpn
rm -f /home/vps/public_html/client-tcp-$ovpn.ovpn
cat > /etc/openvpn/server/server-tcp-$vpn1.conf<<END
port $vpn1
proto tcp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.6.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status openvpn-tcp.log
verb 3
END
cat > /etc/openvpn/client-tcp-$vpn1.ovpn <<-END
client
dev tun
proto tcp
remote $MYIP $vpn1
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END
echo '<ca>' >> /etc/openvpn/client-tcp-$vpn1.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-tcp-$vpn1.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-$vpn.ovpn
cp /etc/openvpn/client-tcp-$vpn1.ovpn /home/vps/public_html/client-tcp-$vpn1.ovpn
systemctl disable --now openvpn-server@server-tcp-$ovpn > /dev/null
systemctl enable --now openvpn-server@server-tcp-$vpn1 > /dev/null
sed -i "s/   ► OpenVPN                 :TCP $ovpn, UDP $ovpn2, SSL 442/   ► OpenVPN                 :TCP $vpn1, UDP $ovpn2, SSL 442/g" /root/log-install.txt
sed -i "s/$ovpn/$vpn/g" /etc/stunnel/stunnel.conf
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}            Maklumat Port Baru OpenVPN TCP                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru OpenVPN TCP : $vpn !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $vpn1 sudah digunakan. Sila masukkan port lain!"
fi
;;
2)
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}               Menukar Port OpenVPN UDP                   ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "► Sila masukkan port baru OpenVPN UDP: " vpn2
if [ -z $vpn2 ]; then
echo "► Sila masukkan port baru OpenVPN UDP"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn2)
if [[ -z $cek ]]; then
rm -f /etc/openvpn/server/server-udp-$ovpn2.conf
rm -f /etc/openvpn/client-udp-$ovpn2.ovpn
rm -f /home/vps/public_html/client-tcp-$ovpn2.ovpn
cat > /etc/openvpn/server/server-udp-$vpn2.conf<<END
port $vpn2
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.7.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status openvpn-udp.log
verb 3
explicit-exit-notify
END
cat > /etc/openvpn/client-udp-$vpn2.ovpn <<-END
client
dev tun
proto udp
remote $MYIP $vpn2
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END
echo '<ca>' >> /etc/openvpn/client-udp-$vpn2.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-udp-$vpn2.ovpn
echo '</ca>' >> /etc/openvpn/client-udp-$vpn2.ovpn
cp /etc/openvpn/client-udp-$vpn2.ovpn /home/vps/public_html/client-udp-$vpn2.ovpn
systemctl disable --now openvpn-server@server-udp-$ovpn2 > /dev/null
systemctl enable --now openvpn-server@server-udp-$vpn2 > /dev/null
sed -i "s/   ► OpenVPN                     :TCP $ovpn, UDP $ovpn2, SSL 990/   ► OpenVPN                     :TCP $vpn, UDP $vpn2, SSL 990/g" /root/log-install.txt
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}            Maklumat Port Baru OpenVPN UDP                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Port baru OpenVPN UDP : $vpn2 !"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
else
echo "► Port $vpn2 sudah digunakan. Sila masukkan port lain!"
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
port-ovpn
;;
esac
