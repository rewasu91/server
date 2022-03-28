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
echo -e "${C}Menu SSH & OpenVPN${R}           ${C}Menu Trojan V2ray${R}"
echo -e "${B}[001]${R} ► Buat akaun           ${B}[048]${R} ► Membuat akaun"
echo -e "${B}[002]${R} ► Buat akaun trial     ${B}[049]${R} ► Padam akaun"
echo -e "${B}[003]${R} ► Ganti password       ${B}[050]${R} ► Tambah masa aktif"
echo -e "${B}[004]${R} ► Senarai akaun        ${B}[051]${R} ► Cek user login"
echo -e "${B}[005]${R} ► Senarai login"
echo -e "${B}[006]${R} ► Tambah masa aktif    ${C}Menu Trojan Xray${R}"
echo -e "${B}[007]${R} ► Padam akaun          ${B}[052]${R} ► Membuat akaun"
echo -e "${B}[008]${R} ► Padam akaun expire   ${B}[053]${R} ► Padam akaun"
echo -e "${B}[009]${R} ► Setup Autokill SSH   ${B}[054]${R} ► Tambah masa aktif"
echo -e "${B}[010]${R} ► Tunjuk Multi Login   ${B}[055]${R} ► Cek user login"
echo -e "${B}[011]${R} ► Restart servis"
echo -e "                                     ${C}Menu Trojan Xray Grpc$"
echo -e "${C}Menu SSR${R}                     ${B}[056]${R} ► Membuat akaun"
echo -e "${B}[012]${R} ► Membuat akaun        ${B}[057]${R} ► Padam akaun"
echo -e "${B}[013]${R} ► Padam akaun          ${B}[058]${R} ► Tambah masa aktif"
echo -e "${B}[014]${R} ► Tambah masa aktif    ${B}[059]${R} ► Cek user login"
echo -e "${B}[015]${R} ► Menu SSR yang lain"
echo -e ""
echo -e "${C}Menu Shadowsocks${R}"
echo -e "${B}[016]${R} ► Membuat akaun"
echo -e "${B}[017]${R} ► Padam akaun          ${C}Menu Sistem${R}"
echo -e "${B}[018]${R} ► Tambah masa aktif"
echo -e "${B}[019]${R} ► Cek user login       ${C}Untuk yang tiada akaun Cloudflare${R}"
echo -e "                                     ${B}[060]${R} ► Tambah/Tukar domain"
echo -e "${C}Menu Wireguard${R}"
echo -e "${B}[020]${R} ► Membuat akaun        ${C}Untuk yang ada akaun Cloudflare${R}"
echo -e "${B}[021]${R} ► Padam akaun          ${B}[061]${R} ► Tambah ID Cloudflare"
echo -e "${B}[022]${R} ► Tambah masa aktif    ${B}[062]${R} ► Tambah Subdomain Cloudflare"
echo -e "${B}[023]${R} ► Cek user login       ${B}[063]${R} ► Pointing bug ke IP lain"
echo -e "                                     ${B}[064]${R} ► Renew certificate"
echo -e "${C}Menu V2ray Vless${R}"
echo -e "${B}[024]${R} ► Membuat akaun        ${C}Menu Tukar Port Servis${R}"
echo -e "${B}[025]${R} ► Padam akaun          ${B}[065]${R} ► Tukar port OpenVPN"
echo -e "${B}[026]${R} ► Tambah masa aktif    ${B}[066]${R} ► Tukar port Stunnel4"
echo -e "${B}[027]${R} ► Cek user login       ${B}[067]${R} ► Tukar port Squid"
echo -e "                                     ${B}[068]${R} ► Tukar port Wireguard"
echo -e "${C}Menu V2ray Vmess${R}             ${B}[069]${R} ► Tukar port V2ray Vless"
echo -e "${B}[028]${R} ► Membuat akaun        ${B}[070]${R} ► Tukar port V2ray Vmess"
echo -e "${B}[029]${R} ► Padam akaun          ${B}[071]${R} ► Tukar port Xray Vless"
echo -e "${B}[030]${R} ► Tambah masa aktif    ${B}[072]${R} ► Tukar port Xray Vmess"
echo -e "${B}[031]${R} ► Cek user login       ${B}[073]${R} ► Tukar port Xray Grpc"
echo -e "                                     ${B}[074]${R} ► Tukar port Trojan"
echo -e "${C}Menu Xray Vless Xtls${R}"
echo -e "${B}[032]${R} ► Membuat akaun        ${C}Menu Backup & Restore${R}"
echo -e "${B}[033]${R} ► Padam akaun          ${B}[075]${R} ► Backup guna Email"
echo -e "${B}[034]${R} ► Tambah masa aktif    ${B}[076]${R} ► Backup guna Nginx"
echo -e "${B}[035]${R} ► Cek user login       ${B}[077]${R} ► Autobackup guna Email"
echo -e "                                     ${B}[078]${R} ► Autobackup guna Nginx"
echo -e "${C}Menu Xray Vless${R}              ${B}[079]${R} ► Restore guna Email"
echo -e "${B}[036]${R} ► Membuat akaun        ${B}[080]${R} ► Restore guna Nginx"
echo -e "${B}[037]${R} ► Padam akaun"
echo -e "${B}[038]${R} ► Tambah masa aktif    ${C}Lain-lain${R}"
echo -e "${B}[039]${R} ► Cek user login       ${B}[081]${R} ► Menu webmin"
echo -e "                                     ${B}[082]${R} ► Menu set autoreboot"
echo -e "${C}Menu Xray Vmess${R}              ${B}[083]${R} ► Limit Speed"
echo -e "${B}[040]${R} ► Membuat akaun        ${B}[084]${R} ► Semak penggunaan Ram"
echo -e "${B}[041]${R} ► Padam akaun          ${B}[085]${R} ► Speedtest VPS"
echo -e "${B}[042]${R} ► Tambah masa aktif    ${B}[086]${R} ► Info sistem"
echo -e "${B}[042]${R} ► Cek user login       ${B}[087]${R} ► Info autoskrip"
echo -e "                                     ${B}[088]${R} ► Status sistem"
echo -e "C}Menu Xray Grpc${R}                 ${B}[089]${R} ► Restart semua servis"
echo -e "${B}[044]${R} ► Membuat akaun        ${B}[090]${R} ► Reboot VPS"
echo -e "${B}[045]${R} ► Padam akaun          ${B}[091]${R} ► Update skrip & sistem"
echo -e "${B}[046]${R} ► Tambah masa aktif    ${B}[092]${R} ► Tukar Style Menu"
echo -e "${B}[047]${R} ► Cek user login       ${B}[093]${R} ► Keluar"
echo -e ""
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
read -p "► Sila masukkan nombor pilihan anda [1-93]: " menu
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
add-v2rayless
;;
25)
del-v2rayless
;;
26)
renew-v2rayless
;;
27)
cek-v2rayless
;;
28)
add-v2rayvmess
;;
29)
del-v2rayvmess
;;
30)
renew-v2rayvmess
;;
31)
cek-v2rayvmess
;;
32)
add-xrayxtls
;;
33)
del-xrayxtls
;;
34)
renew-xrayxtls
;;
35)
cek-xrayxtls
;;
36)
add-xrayvless
;;
37)
del-xrayvless
;;
38)
renew-xrayvless
;;
39)
cek-xrayvless
;;
40)
add-xrayvmess
;;
41)
del-vxrayvmess
;;
42)
renew-xrayvmess
;;
43)
cek-xrayvmess
;;
44)
add-xraygrpc
;;
45)
del-xraygrpc
;;
46)
renew-xraygrpc
;;
47)
cek-xraygrpc
;;
48)
add-v2raytrojan
;;
49)
del-v2raytrojan
;;
50)
renew-v2raytrojan
;;
51)
cek-v2raytrojan
;;
52)
add-xraytrojan
;;
53)
del-xraytrojan
;;
54)
renew-xraytrojan
;;
55)
cek-xraytrojan
;;
56)
add-xraytrojangrpc
;;
57)
del-xraytrojangrpc
;;
58)
renew-xraytrojangrpc
;;
59)
cek-xraytrojangrpc
;;
60)
add-host
;;
61)
add-cff
;;
62)
add-dom
;;
63)
add-cfh
;;
64)
certv2ray
;;
65)
port-ovpn
;;
66)
port-stunnel4
;;
67)
port-squid
;;
68)
port-wg
;;
69)
port-v2rayvless
;;
70)
port-v2rayvmess
;;
71)
port-xrayvless
;;
72)
port-xrayvmess
;;
73)
port-xraygrpc
;;
74)
port-trojan
;;
75)
restoreemail
;;
76)
backupnginx
;;
77)
autobackupemail
;;
78)
autobackupnginx
;;
79)
restoreemail
;;
80)
restorenginx
;;
81)
menu-webmin
;;
82)
menu-autoreboot
;;
83)
lmit-speed
;;
84)
ram
;;
85)
speedtest
;;
86)
info-system
;;
87)
info-script
;;
88)
running
;;
89)
restart
;;
90)
reboot
;;
91)
update
;;
92)
menu-changemenu
;;
93)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu
;;
esac
