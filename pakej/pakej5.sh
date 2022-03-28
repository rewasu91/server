#!/bin/bash

clear
apt-get install figlet
apt-get install cowsay fortune-mod -y
ln -s /usr/games/cowsay /bin
ln -s /usr/games/fortune /bin
clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '            KAIZEN'
echo -e ""
echo -e "     —————————————————————————————————————————————————————————"
echo -e "     *        Autoskrip VPS Premium KaizenVPN Pakej 5        *"
echo -e "     —————————————————————————————————————————————————————————"
echo -e "     *            Dibuat & Diubahsuai oleh KaizenVPN         *"
echo -e "     *     Untuk Debian 9, Debian 10 & Debian 11 64 bit      *"
echo -e "     *Untuk Ubuntu 18.04, Ubuntu 20.04 & Ubuntu 21.10 64 bit *"
echo -e "     *          Untuk VPS sistem jenis KVM dan VMWare        *"
echo -e "     *                    Telegram: @KaizenA                 *"
echo -e "     —————————————————————————————————————————————————————————"
echo -e "     * PROSES PEMASANGAN SKRIP AKAN BERMULA SEBENTAR LAGI..  *"
echo -e "     *                  TERIMA KASIH BOSKU!                  *"
echo -e "     —————————————————————————————————————————————————————————"
echo -e ""
sleep 8
clear

# ==========================================
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
# ==========================================

clear
if [ "${EUID}" -ne 0 ]; then
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————${R}"
echo -e "${D1}       Proses Semakan Pengguna Root       ${R}"
echo -e "${D}——————————————————————————————————————————${R}"
echo -e ""
sleep 2
		echo -e "${A} Maaf, anda perlu menjalankan skrip ini sebagai pengguna root${R}"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————${R}"
echo -e "${D1}         Proses Semakan Sistem VPS        ${R}"
echo -e "${D}——————————————————————————————————————————${R}"
echo -e ""
sleep 2
		echo -e "${A} Maaf, sistem operasi jenis OpenVZ tidak support untuk skrip ini${R}"
		exit 1
fi

MYIP=$(wget -qO- ipinfo.io/ip);

IZIN=$( curl https://raw.githubusercontent.com/rewasu91/public/main/ipaddress.sh | grep $MYIP )

if [ $MYIP = $IZIN ]; then
clear
echo -e "${D}——————————————————————————————————————————${R}"
echo -e "${D1}         Proses Semakan IP Address        ${R}"
echo -e "${D}——————————————————————————————————————————${R}"
echo -e ""
sleep 2
echo -e "${B} Tahniah, IP address anda telah berdaftar! ${R}"
echo -e "${B} Proses pemasangan skrip vps akan bermula sekarang..${R}"
sleep 3
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

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}             Sila Tunggu Sebentar            ${R}"
echo -e "${D1}  Proses Update & Upgrade Sedang Dijalankan  ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
apt update && apt upgrade -y
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}    Proses Update & Upgrade Sudah Selesai    ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Selesai!! ${R}"
sleep 2
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}        Proses Seterusnya Sila Tunggu        ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
clear

#Folder
mkdir /var/lib/Kaizen;
echo "IP=" >> /var/lib/Kaizen/ipvps.conf
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
echo "IP=$domain" >> /var/lib/Kaizen/ipvps.conf
echo $domain > /etc/xray/domain
cp /etc/xray/domain /root/domain
cp /etc/xray/domain /etc/v2ray/domain
mkdir -p /etc/v2ray
mkdir -p /etc/xray
touch /root/domain
touch /etc/v2ray/domain
touch /etc/xray/Domain

clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————————————————${R}"
echo -e "${D1} Sila Masukkan Domain Anda, Jika Tiada, Sila Tekan ENTER ${R}"
echo -e "${D}—————————————————————————————————————————————————————————${R}"
echo -e ""
read -p "Hostname / Domain: " domain
echo "IP=$domain" >> /var/lib/Kaizen/ipvps.conf
echo $domain > /root/domain
echo $domain > /etc/xray/domain
echo $domain > /etc/v2ray/domain
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}        Memasang Servis SSH & OPENVPN        ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
clear
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/ssh-vpn5.sh && chmod +x ssh-vpn5.sh && ./ssh-vpn5.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————————————${R}"
echo -e "${D1}                 Servis SSH & OPENVPN                ${R}"
echo -e "${D}—————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis SSH & OPENVPN telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}            Memasang Servis SSTP             ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/sstp.sh && chmod +x sstp.sh && ./sstp.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}                Servis SSTP                  ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis SSTP telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}             Memasang Servis IPSEC           ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/ipsec.sh && chmod +x ipsec.sh && ./ipsec.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}                 Servis IPSEC                ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis IPSEC telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}             Memasang Servis SSR             ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/ssr.sh && chmod +x ssr.sh && ./ssr.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}                Servis SSR                   ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis SSR telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}        Memasang Servis Shadowsocksobfs      ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/sodosok.sh && chmod +x sodosok.sh && ./sodosok.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}          Servis Shadowsocksobfs             ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis Shadowsocksobfs telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}           Memasang Servis Wireguard         ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/wg.sh && chmod +x wg.sh && ./wg.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}               Servis Wireguard              ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis Wireguard telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}             Memasang Servis Xray            ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}                 Servis Xray                 ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis Xray telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}           Memasang Servis Trojan Go         ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/ins-trgo.sh && chmod +x ins-trgo.sh && ./ins-trgo.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}              Servis Trojan Go               ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis Trojan Go telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}             Memasang Servis Backup          ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/set-br.sh && chmod +x set-br.sh && ./set-br.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}                 Servis Backup               ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis Backup telah berjaya dipasang!${R}"
sleep 2
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}             Memasang Servis WebSocket       ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/ws.sh && chmod +x ws.sh && ./ws.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}                 Servis WebSocket            ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis WebSocket telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}             Memasang Servis OHP             ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/ohp.sh && chmod +x ohp.sh && ./ohp.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}                 Servis OHP                  ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis OHP telah berjaya dipasang!${R}"
sleep 2
clear

echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}             Memasang Servis Cert            ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
sleep 2
wget https://raw.githubusercontent.com/rewasu91/vps/main/install/cert.sh && chmod +x cert.sh && ./cert.sh
clear
echo -e ""
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e "${D1}                 Servis Cert                 ${R}"
echo -e "${D}—————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B} Servis Cert telah berjaya dipasang!${R}"
sleep 2
clear

apt install linux-headers-cloud-amd64 -y
apt install --reinstall wireguard-dkms -y

cat > /etc/init.d/my-start-script <<EOL
#!/bin/bash
### BEGIN INIT INFO
# Provides:       my-start-script
# Required-Start:    \$local_fs \$syslog
# Required-Stop:     \$local_fs \$syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts my-start-script
# Description:       starts my-start-script using start-stop-daemon
### END INIT INFO

chmod +x /etc/stunnel/stunnel.pem
systemctl restart stunnel4
systemctl start stunnel4
systemctl daemon-reload
systemctl start xrayvmesstls
systemctl enable xrayvmesstls
systemctl restart xrayvmesstls
systemctl start xrayvmessnonetls
systemctl enable xrayvmessnonetls
systemctl restart xrayvmessnonetls
systemctl start xrayvmessmkcp
systemctl enable xrayvmessmkcp
systemctl restart xrayvmessmkcp
systemctl start xrayvlesstls
systemctl enable xrayvlesstls
systemctl restart xrayvlesstls
systemctl start xrayvlessnonetls
systemctl enable xrayvlessnonetls
systemctl restart xrayvlessnonetls
systemctl start xrayxtls
systemctl enable xrayxtls
systemctl restart xrayxtls
systemctl start xraytrojan
systemctl enable xraytrojan
systemctl restart xraytrojan
systemctl start xrayvmessgrpc
systemctl enable xrayvmessgrpc
systemctl restart xrayvmessgrpc
systemctl start xrayvlessgrpc
systemctl enable xrayvlessgrpc
systemctl restart xrayvlessgrpc
systemctl start xraytrojangrpc
systemctl enable xraytrojangrpc
systemctl restart xraytrojangrpc
systemctl start trojan-go
systemctl enable trojan-go
systemctl restart trojan-go

exit 0
EOL
chmod 755 /etc/init.d/my-start-script
update-rc.d my-start-script defaults

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/ipsec.sh
rm -f /root/ssr.sh
rm -f /root/sodosok.sh
rm -f /root/wg.sh
rm -f /root/ins-xray.sh
rm -f /root/ins-trgo.sh
rm -f /root/set-br.sh
rm -f /root/ws.sh
rm -f /root/ohp.sh
rm -f /root/cert.sh
rm -rf /root/ipvps
rm -f /etc/ip
rm -f /root/tmp
history -c

echo "1" > /home/ver
clear
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
cowsay -f dragon "SELESAI, TAHNIAH BOSKU! INI MAKLUMAT SERVIS DAN PORT!"
echo -e ""
sleep 3

clear
echo -e ""								| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   *             Servis SSH, OPENVPN & SQUID             *" 	| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   ► OpenSSH                     :22, 442" 			| tee -a log-install.txt
echo -e "   ► OpenVPN                     :TCP 1194, UDP 2200, SSL 990" | tee -a log-install.txt
echo -e "   ► Stunnel4                    :443, 777, 789" 		| tee -a log-install.txt
echo -e "   ► Dropbear                    :109, 143" 			| tee -a log-install.txt
echo -e "   ► Privoxy                     :3000" 			| tee -a log-install.txt
echo -e "   ► Squid                       :3128, 8080" 			| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   *                   Servis WebSocket                  *" 	| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   ► WebSocket TLS               :777" 			| tee -a log-install.txt
echo -e "   ► WebSocket None TLS          :8880" 			| tee -a log-install.txt
echo -e "   ► WebSocket OpenVPN           :2086" 			| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   *                      Servis OHP                     *" 	| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   ► OHP OpenSSH                 :8181" 			| tee -a log-install.txt
echo -e "   ► OHP Dropbear                :8282" 			| tee -a log-install.txt
echo -e "   ► OHP OpenVPN                 :8383" 			| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   *                   Servis Wireguard                  *" 	| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   ► Wireguard                   :7070" 			| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   *                     Servis XRay                     *" 	| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   ► Xray Vless Tcp Xtls Splice  :756"  			| tee -a log-install.txt
echo -e "   ► Xray Vless Tcp Tls          :6565"  			| tee -a log-install.txt
echo -e "   ► Xray Vless Tcp None Tls     :6666"  			| tee -a log-install.txt
echo -e "   ► Xray Vless Grpc             :880"  			| tee -a log-install.txt
echo -e "   ► Xray Vmess Tcp Tls          :6363"  			| tee -a log-install.txt
echo -e "   ► Xray Vmess Tcp None Tls     :6464"  			| tee -a log-install.txt
echo -e "   ► Xray Vmess Kcp              :6161"  			| tee -a log-install.txt
echo -e "   ► Xray Vmess Grpc             :80"  			| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   *                    Servis Trojan                    *" 	| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   ► Trojan Go                   :2096"  			| tee -a log-install.txt
echo -e "   ► Xray Trojan                 :2089"  			| tee -a log-install.txt
echo -e "   ► Xray Trojan Grpc            :2091"  			| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   *                     Servis Lain                     *" 	| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   ► Badvpn                      :7100, 7200, 7300"  		| tee -a log-install.txt
echo -e "   ► Nginx                       :89"  			| tee -a log-install.txt
echo -e "   ► L2TP/IPSEC VPN              :1701"  			| tee -a log-install.txt
echo -e "   ► PPTP VPN                    :1732"  			| tee -a log-install.txt
echo -e "   ► SSTP VPN                    :444"  			| tee -a log-install.txt
echo -e "   ► Shadowsocks-R               :1443" 			| tee -a log-install.txt
echo -e "   ► SS-OBFS TLS                 :8488" 			| tee -a log-install.txt
echo -e "   ► SS-OBFS HTTP                :8388" 			| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   *            Maklumat Server & Fungsi Lain            *" 	| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   ► Timezone                    :Asia/Malaysia (UTC +8)"  	| tee -a log-install.txt
echo -e "   ► Fail2Ban                    :[ON]"  			| tee -a log-install.txt
echo -e "   ► Dflate                      :[ON]"  			| tee -a log-install.txt
echo -e "   ► IPtables                    :[ON]"  			| tee -a log-install.txt
echo -e "   ► Auto-Reboot                 :[ON/SET]"  			| tee -a log-install.txt
echo -e "   ► IPv6                        :[OFF]"  			| tee -a log-install.txt
echo -e "   ► Autoreboot pada pukul 05.00 pagi (UTC +8)" 		| tee -a log-install.txt
echo -e "   ► Autobackup Data" 						| tee -a log-install.txt
echo -e "   ► Restore Data" 						| tee -a log-install.txt
echo -e "   ► Auto Delete Akaun Expire" 				| tee -a log-install.txt
echo -e "   ► Installation Log --> /root/log-install.txt"  		| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   *                   Developer Skrip                   *" 	| tee -a log-install.txt
echo -e "   ———————————————————————————————————————————————————————" 	| tee -a log-install.txt
echo -e "   ► Dev/Main                    :KaizenVPN"  			| tee -a log-install.txt
echo -e "   ► Telegram                    :t.me/KaizenA"  		| tee -a log-install.txt
echo -e ""
sleep 5
echo -e "—————————————————————————————————————————————"
echo -e "      SISTEM AKAN REBOOT SEBENTAR LAGI       "
echo -e "—————————————————————————————————————————————"
echo -e ""

systemctl daemon-reload
systemctl start xrayvmesstls
systemctl enable xrayvmesstls
systemctl restart xrayvmesstls
systemctl start xrayvmessnonetls
systemctl enable xrayvmessnonetls
systemctl restart xrayvmessnonetls
systemctl start xrayvmessmkcp
systemctl enable xrayvmessmkcp
systemctl restart xrayvmessmkcp
systemctl start xrayvlesstls
systemctl enable xrayvlesstls
systemctl restart xrayvlesstls
systemctl start xrayvlessnonetls
systemctl enable xrayvlessnonetls
systemctl restart xrayvlessnonetls
systemctl start xrayxtls
systemctl enable xrayxtls
systemctl restart xrayxtls
systemctl start xraytrojan
systemctl enable xraytrojan
systemctl restart xraytrojan
systemctl start xrayvmessgrpc
systemctl enable xrayvmessgrpc
systemctl restart xrayvmessgrpc
systemctl start xrayvlessgrpc
systemctl enable xrayvlessgrpc
systemctl restart xrayvlessgrpc
systemctl start xraytrojangrpc
systemctl enable xraytrojangrpc
systemctl restart xraytrojangrpc
systemctl start trojan-go
systemctl enable trojan-go
systemctl restart trojan-go

rm -f setup.sh
rm -f /root/.bash_history
echo -e " ${A}Server akan auto Reboot dalam masa 5 saat..${R}"
sleep 5
reboot
