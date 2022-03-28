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
echo -e "${C}Menu SSH & OpenVPN${R}           ${C}Menu Trojan Go${R}"
echo -e "${B}[001]${R} ► Buat akaun           ${B}[044]${R} ► Membuat akaun"
echo -e "${B}[002]${R} ► Buat akaun trial     ${B}[045]${R} ► Padam akaun"
echo -e "${B}[003]${R} ► Ganti password       ${B}[046]${R} ► Tambah masa aktif"
echo -e "${B}[004]${R} ► Senarai akaun        ${B}[047]${R} ► Cek user login"
echo -e "${B}[005]${R} ► Senarai login"
echo -e "${B}[006]${R} ► Tambah masa aktif    ${C}Menu Trojan Xray Grpc${R}"
echo -e "${B}[007]${R} ► Padam akaun          ${B}[048]${R} ► Membuat akaun"
echo -e "${B}[008]${R} ► Padam akaun expire   ${B}[049${R} ► Padam akaun"
echo -e "${B}[009]${R} ► Setup Autokill SSH   ${B}[050]${R} ► Tambah masa aktif"
echo -e "${B}[010]${R} ► Tunjuk Multi Login   ${B}[051]${R} ► Cek user login"
echo -e "${B}[011]${R} ► Restart servis"
echo -e ""
echo -e "${C}Menu SSR${R}"
echo -e "${B}[012]${R} ► Membuat akaun"
echo -e "${B}[013]${R} ► Padam akaun"
echo -e "${B}[014]${R} ► Tambah masa aktif"
echo -e "${B}[015]${R} ► Menu SSR yang lain   ${C}Menu Sistem${R}"
echo -e ""
echo -e "${C}Menu Shadowsocks${R}             ${C}Untuk yang tiada akaun Cloudflare${R}"
echo -e "${B}[016]${R} ► Membuat akaun        ${B}[052]${R} ► Tambah/Tukar domain"
echo -e "${B}[017]${R} ► Padam akaun"
echo -e "${B}[018]${R} ► Tambah masa aktif    ${C}Untuk yang ada akaun Cloudflare${R}"
echo -e "${B}[019]${R} ► Cek user login       ${B}[053]${R} ► Tambah ID Cloudflare"
echo -e "                                     ${B}[054]${R} ► Tambah Subdomain Cloudflare"
echo -e "${C}Menu Wireguard${R}               ${B}[055]${R} ► Pointing bug ke IP lain"
echo -e "${B}[020]${R} ► Membuat akaun        ${B}[056]${R} ► Renew certificate"
echo -e "${B}[021]${R} ► Padam akaun"
echo -e "${B}[022]${R} ► Tambah masa aktif    ${C}Menu Tukar Port Servis${R}"
echo -e "${B}[023]${R} ► Cek user login       ${B}[057]${R} ► Tukar port OpenVPN"
echo -e "                                     ${B}[058]${R} ► Tukar port Stunnel4"
echo -e "${C}Menu Xray Vless Xtls${R}         ${B}[059]${R} ► Tukar port Squid"
echo -e "${B}[024]${R} ► Membuat akaun        ${B}[060]${R} ► Tukar port Wireguard"
echo -e "${B}[025]${R} ► Padam akaun          ${B}[061]${R} ► Tukar port Xray Vless"
echo -e "${B}[026]${R} ► Tambah masa aktif    ${B}[062]${R} ► Tukar port Xray Vmess"
echo -e "${B}[027]${R} ► Cek user login       ${B}[063]${R} ► Tukar port Xray Grpc"
echo -e "                                     ${B}[064]${R} ► Tukar port Trojan"
echo -e "${C}Menu Xray Vless${R}"
echo -e "${B}[028]${R} ► Membuat akaun        ${C}Menu Backup & Restore${R}"
echo -e "${B}[029]${R} ► Padam akaun          ${B}[065]${R} ► Backup guna Email"
echo -e "${B}[030]${R} ► Tambah masa aktif    ${B}[066]${R} ► Backup guna Nginx"
echo -e "${B}[031]${R} ► Cek user login       ${B}[067]${R} ► Autobackup guna Email"
echo -e "                                     ${B}[068]${R} ► Autobackup guna Nginx"
echo -e "${C}Menu Xray Vmess${R}              ${B}[069]${R} ► Restore guna Email"
echo -e "${B}[032]${R} ► Membuat akaun        ${B}[070]${R} ► Restore guna Nginx"
echo -e "${B}[033]${R} ► Padam akaun"
echo -e "${B}[034]${R} ► Tambah masa aktif    ${C}Lain-lain${R}"
echo -e "${B}[035]${R} ► Cek user login       ${B}[071]${R} ► Menu webmin"
echo -e "                                     ${B}[072]${R} ► Menu set autoreboot"
echo -e "${C}Menu Xray Grpc${R}               ${B}[073]${R} ► Limit Speed"
echo -e "${B}[036]${R} ► Membuat akaun        ${B}[074]${R} ► Semak penggunaan Ram"
echo -e "${B}[037]${R} ► Padam akaun          ${B}[075]${R} ► Speedtest VPS"
echo -e "${B}[038]${R} ► Tambah masa aktif    ${B}[076]${R} ► Info sistem"
echo -e "${B}[039]${R} ► Cek user login       ${B}[077]${R} ► Info autoskrip"
echo -e "                                     ${B}[078]${R} ► Status sistem"
echo -e "${C}Menu Trojan Xray${R}             ${B}[079]${R} ► Restart semua servis"
echo -e "${B}[040]${R} ► Membuat akaun        ${B}[080]${R} ► Reboot VPS"
echo -e "${B}[041]${R} ► Padam akaun          ${B}[081]${R} ► Update skrip & sistem"
echo -e "${B}[042]${R} ► Tambah masa aktif    ${B}[082]${R} ► Tukar Style Menu"
echo -e "${B}[043]${R} ► Cek user login       ${B}[083]${R} ► Keluar"
echo -e ""
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
read -p "► Sila masukkan nombor pilihan anda [1-83]: " menu
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
add-trgo
;;
45)
del-trgo
;;
46)
renew-trgo
;;
47)
cek-trgo
;;
48)
add-xraytrojangrpc
;;
49)
del-xraytrojangrpc
;;
50)
renew-xraytrojangrpc
;;
51)
cek-xraytrojangrpc
;;
52)
add-host
;;
53)
add-cff
;;
54)
add-dom
;;
55)
add-cfh
;;
56)
certv2ray
;;
57)
port-ovpn
;;
58)
port-stunnel4
;;
59)
port-squid
;;
60)
port-wg
;;
61)
port-xrayvless
;;
62)
port-xrayvmess
;;
63)
port-xraygrpc
;;
64)
port-trojan
;;
65)
backupemail
;;
66)
backupnginx
;;
67)
autobackupemail
;;
68)
autobackupnginx
;;
69)
restoreemail
;;
70)
restorenginx
;;
71)
menu-webmin
;;
72)
menu-autoreboot
;;
73)
limit-speed
;;
74)
ram
;;
75)
speedtest
;;
76)
info-system
;;
77)
info-script
;;
78)
running
;;
79)
restart
;;
80)
reboot
;;
81)
update
;;
82)
menu-changemenu
;;
83)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu
;;
esac
