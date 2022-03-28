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

clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
domain=$(cat /etc/v2ray/domain)
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
echo -e "* MASA     : $jam"
echo -e "* HARI     : $hari"
echo -e "* TARIKH   : $tnggl"
echo -e "* TIMEZONE : $WKT"
echo -e "* SERVER   : $ISP"
echo -e "* BANDAR   : $CITY"
echo -e "* IP VPS   : $IPVPS"
echo -e "* DOMAIN   : ${domain}"
echo -e ""
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
echo -e "${D1}                   Senarai Servis & Protokol                    ${R}"
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${C}Menu SSH & OpenVPN${R}           ${C}Menu Trojan Xray${R}"
echo -e "${B}[001]${R} ► Buat akaun           ${B}[040]${R} ► Membuat akaun"
echo -e "${B}[002]${R} ► Buat akaun trial     ${B}[041]${R} ► Padam akaun"
echo -e "${B}[003]${R} ► Ganti password       ${B}[042]${R} ► Tambah masa aktif"
echo -e "${B}[004]${R} ► Senarai akaun        ${B}[053]${R} ► Cek user login"
echo -e "${B}[005]${R} ► Senarai login"
echo -e "${B}[006]${R} ► Tambah masa aktif    ${C}Menu Trojan Xray Grpc${R}"
echo -e "${B}[007]${R} ► Padam akaun          ${B}[044]${R} ► Membuat akaun"
echo -e "${B}[008]${R} ► Padam akaun expire   ${B}[045${R} ► Padam akaun"
echo -e "${B}[009]${R} ► Setup Autokill SSH   ${B}[046]${R} ► Tambah masa aktif"
echo -e "${B}[010]${R} ► Tunjuk Multi Login   ${B}[047]${R} ► Cek user login"
echo -e "${B}[011]${R} ► Restart servis"
echo -e ""
echo -e "${C}Menu SSR${R}                     ${C}Untuk yang tiada akaun Cloudflare${R}"
echo -e "${B}[012]${R} ► Membuat akaun        ${B}[048]${R} ► Tambah/Tukar domain"
echo -e "${B}[013]${R} ► Padam akaun"
echo -e "${B}[014]${R} ► Tambah masa aktif    ${C}Untuk yang ada akaun Cloudflare${R}"
echo -e "${B}[015]${R} ► Menu SSR yang lain   ${B}[049]${R} ► Tambah ID Cloudflare"
echo -e "                                     ${B}[050]${R} ► Tambah Subdomain Cloudflare"
echo -e "${C}Menu Shadowsocks${R}             ${B}[051]${R} ► Pointing bug ke IP lain"
echo -e "${B}[016]${R} ► Membuat akaun        ${B}[052]${R} ► Renew certificate"
echo -e "${B}[017]${R} ► Padam akaun"
echo -e "${B}[018]${R} ► Tambah masa aktif    ${C}Menu Tukar Port Servis${R}"
echo -e "${B}[019]${R} ► Cek user login       ${B}[053]${R} ► Tukar port OpenVPN"
echo -e "                                     ${B}[054]${R} ► Tukar port Stunnel4"
echo -e "${C}Menu Wireguard${R}               ${B}[055]${R} ► Tukar port Squid"
echo -e "${B}[020]${R} ► Membuat akaun        ${B}[056]${R} ► Tukar port Wireguard"
echo -e "${B}[021]${R} ► Padam akaun          ${B}[057]${R} ► Tukar port Xray Vless"
echo -e "${B}[022]${R} ► Tambah masa aktif    ${B}[058]${R} ► Tukar port Xray Vmess"
echo -e "${B}[023]${R} ► Cek user login       ${B}[059]${R} ► Tukar port Xray Grpc"
echo -e "                                     ${B}[060]${R} ► Tukar port Trojan"
echo -e "${C}Menu Xray Vless Xtls${R}"
echo -e "${B}[024]${R} ► Membuat akaun        ${C}Menu Backup & Restore${R}"
echo -e "${B}[025]${R} ► Padam akaun          ${B}[061]${R} ► Backup guna Email"
echo -e "${B}[026]${R} ► Tambah masa aktif    ${B}[062]${R} ► Backup guna Nginx"
echo -e "${B}[027]${R} ► Cek user login       ${B}[063]${R} ► Autobackup guna Email"
echo -e "                                     ${B}[064]${R} ► Autobackup guna Nginx"
echo -e "${C}Menu Xray Vless${R}              ${B}[065]${R} ► Restore guna Email"
echo -e "${B}[028]${R} ► Membuat akaun        ${B}[066]${R} ► Restore guna Nginx"
echo -e "${B}[029]${R} ► Padam akaun"
echo -e "${B}[030]${R} ► Tambah masa aktif    ${C}Lain-lain${R}"
echo -e "${B}[031]${R} ► Cek user login       ${B}[067]${R} ► Menu webmin"
echo -e "                                     ${B}[068]${R} ► Menu set autoreboot"
echo -e "${C}Menu Xray Vmess${R}              ${B}[069]${R} ► Limit Speed"
echo -e "${B}[032]${R} ► Membuat akaun        ${B}[070]${R} ► Semak penggunaan Ram"
echo -e "${B}[033]${R} ► Padam akaun          ${B}[071]${R} ► Speedtest VPS"
echo -e "${B}[034]${R} ► Tambah masa aktif    ${B}[072]${R} ► Info sistem"
echo -e "${B}[035]${R} ► Cek user login       ${B}[073]${R} ► Info autoskrip"
echo -e "                                     ${B}[074]${R} ► Status sistem"
echo -e "${C}Menu Xray Grpc${R}               ${B}[075]${R} ► Restart semua servis"
echo -e "${B}[036]${R} ► Membuat akaun        ${B}[076]${R} ► Reboot VPS"
echo -e "${B}[037]${R} ► Padam akaun          ${B}[077]${R} ► Update skrip & sistem"
echo -e "${B}[038]${R} ► Tambah masa aktif    ${B}[078]${R} ► Tukar Style Menu"
echo -e "${B}[039]${R} ► Cek user login       ${B}[079]${R} ► Keluar"
echo -e ""
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
read -p "► Sila masukkan nombor pilihan anda [1-79]: " menu
echo -e ""
case $menu in
1)
add-sshvpn
;;
2)
add-trial
;;
3)
change-passwd
;;
4)
cek-listmember
;;
5)
cek-login
;;
6)
renew-sshvpn
;;
7)
del-sshvpn
;;
8)
del-expiresshvpn
;;
9)
autokill
;;
10)
cek-lim
;;
11) 
restart 
;;
12)
add-ssr
;;
13)
del-ssr
;;
14)
renew-ssr
;;
15)
ssr
;;
16)
add-ss
;;
17)
del-ss
;;
18)
renew-ss
;;
19)
cek-ss
;;
20)
add-wg
;;
21)
del-wg
;;
22)
renew-wg
;;
23)
cek-wg
;;
24)
add-xrayxtls
;;
25)
del-xrayxtls
;;
26)
renew-xrayxtls
;;
27)
cek-xrayxtls
;;
28)
add-xrayvless
;;
29)
del-xrayvless
;;
30)
renew-xrayvless
;;
31)
cek-xrayvless
;;
32)
add-xrayvmess
;;
33)
del-vxrayvmess
;;
34)
renew-xrayvmess
;;
35)
cek-xrayvmess
;;
36)
add-xraygrpc
;;
37)
del-xraygrpc
;;
38)
renew-xraygrpc
;;
39)
cek-xraygrpc
;;
40)
add-xraytrojan
;;
41)
del-xraytrojan
;;
42)
renew-xraytrojan
;;
43)
cek-xraytrojan
;;
44)
add-xraytrojangrpc
;;
45)
del-xraytrojangrpc
;;
46)
renew-xraytrojangrpc
;;
47)
cek-xraytrojangrpc
;;
48)
add-host
;;
49)
add-cff
;;
50)
add-dom
;;
51)
add-cfh
;;
52)
certv2ray
;;
53)
port-ovpn
;;
54)
port-stunnel4
;;
55)
port-squid
;;
56)
port-wg
;;
57)
port-xrayvless
;;
58)
port-xrayvmess
;;
59)
port-xraygrpc
;;
60)
port-trojan
;;
61)
backupemail
;;
62)
backupnginx
;;
63)
autobackupemail
;;
64)
autobackupnginx
;;
65)
restoreemail
;;
66)
restorenginx
;;
67)
menu-webmin
;;
68)
menu-autoreboot
;;
69)
limit-speed
;;
70)
ram
;;
71)
speedtest
;;
72)
info-system
;;
73)
info-script
;;
74)
running
;;
75)
restart
;;
76)
reboot
;;
77)
update
;;
78)
menu-changemenu
;;
79)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu
;;
esac
