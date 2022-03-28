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
echo -e "${C}Menu SSH & OpenVPN${R}           ${C}Menu Xray Grpc${R}"
echo -e "${B}[001]${R} ► Buat akaun           ${B}[055]${R} ► Membuat akaun"
echo -e "${B}[002]${R} ► Buat akaun trial     ${B}[056]${R} ► Padam akaun"
echo -e "${B}[003]${R} ► Ganti password       ${B}[057]${R} ► Tambah masa aktif"
echo -e "${B}[004]${R} ► Senarai akaun        ${B}[058]${R} ► Cek user login"
echo -e "${B}[005]${R} ► Senarai login"
echo -e "${B}[006]${R} ► Tambah masa aktif    ${C}Menu Trojan V2ray${R}"
echo -e "${B}[007]${R} ► Padam akaun          ${B}[059]${R} ► Membuat akaun"
echo -e "${B}[008]${R} ► Padam akaun expire   ${B}[060]${R} ► Padam akaun"
echo -e "${B}[009]${R} ► Setup Autokill SSH   ${B}[061]${R} ► Tambah masa aktif"
echo -e "${B}[010]${R} ► Tunjuk Multi Login   ${B}[062]${R} ► Cek user login"
echo -e "${B}[011]${R} ► Restart servis"
echo -e "                             ${C}Menu Trojan Xray${R}"
echo -e "${C}Menu L2TP${R}                    ${B}[063]${R} ► Membuat akaun"
echo -e "${B}[012]${R} ► Membuat akaun        ${B}[064]${R} ► Padam akaun"
echo -e "${B}[013]${R} ► Padam akaun          ${B}[065]${R} ► Tambah masa aktif"
echo -e "${B}[014]${R} ► Tambah masa aktif    ${B}[066]${R} ► Cek user login"
echo -e ""
echo -e "${C}Menu SSTP${R}                    ${C}Menu Trojan Xray Grpc${R}"
echo -e "${B}[015]${R} ► Membuat akaun        ${B}[067]${R} ► Membuat akaun"
echo -e "${B}[016]${R} ► Padam akaun          ${B}[068]${R} ► Padam akaun"
echo -e "${B}[017]${R} ► Tambah masa aktif    ${B}[069]${R} ► Tambah masa aktif"
echo -e "${B}[018]${R} ► Cek user login       ${B}[070]${R} ► Cek user login"
echo -e ""
echo -e "${C}Menu PPTP${R}"
echo -e "${B}[019]${R} ► Membuat akaun"
echo -e "${B}[020]${R} ► Padam akaun"
echo -e "${B}[021]${R} ► Tambah masa aktif"
echo -e "${B}[022]${R} ► Cek user login"
echo -e ""
echo -e "${C}Menu SSR${R}"
echo -e "${B}[023]${R} ► Membuat akaun        ${C}Menu Sistem${R}"
echo -e "${B}[024]${R} ► Padam akaun"
echo -e "${B}[025]${R} ► Tambah masa aktif    ${C}Untuk yang tiada akaun Cloudflare${R}"
echo -e "${B}[026]${R} ► Menu SSR yang lain   ${B}[071]${R} ► Tambah/Tukar domain"
echo -e ""
echo -e "${C}Menu Shadowsocks${R}             ${C}Untuk yang ada akaun Cloudflare${R}"
echo -e "${B}[027]${R} ► Membuat akaun        ${B}[072]${R} ► Tambah ID Cloudflare"
echo -e "${B}[028]${R} ► Padam akaun          ${B}[073]${R} ► Tambah Subdomain Cloudflare"
echo -e "${B}[029]${R} ► Tambah masa aktif    ${B}[074]${R} ► Pointing bug ke IP lain"
echo -e "${B}[030]${R} ► Cek user login       ${B}[075]${R} ► Renew certificate"
echo -e ""
echo -e "${C}Menu Wireguard${R}               ${C}Menu Tukar Port Servis${R}"
echo -e "${B}[031]${R} ► Membuat akaun        ${B}[076]${R} ► Tukar port OpenVPN"
echo -e "${B}[032]${R} ► Padam akaun          ${B}[077]${R} ► Tukar port Stunnel4"
echo -e "${B}[033]${R} ► Tambah masa aktif    ${B}[078]${R} ► Tukar port Squid"
echo -e "${B}[034]${R} ► Cek user login       ${B}[079]${R} ► Tukar port SSTP"
echo -e "                             ${B}[080]${R} ► Tukar port Wireguard"
echo -e "${C}Menu V2ray Vless${R}             ${B}[081]${R} ► Tukar port V2ray Vless"
echo -e "${B}[035]${R} ► Membuat akaun        ${B}[082]${R} ► Tukar port V2ray Vmess"
echo -e "${B}[036]${R} ► Padam akaun          ${B}[083]${R} ► Tukar port Xray Vless"
echo -e "${B}[037]${R} ► Tambah masa aktif    ${B}[084]${R} ► Tukar port Xray Vmess"
echo -e "${B}[038]${R} ► Cek user login       ${B}[085]${R} ► Tukar port Xray Grpc"
echo -e "                             ${B}[086]${R} ► Tukar port Trojan"
echo -e "${C}Menu V2ray Vmess${R}"
echo -e "${B}[039]${R} ► Membuat akaun        ${C}Menu Backup & Restore${R}"
echo -e "${B}[040]${R} ► Padam akaun          ${B}[087]${R} ► Backup guna Email"
echo -e "${B}[041]${R} ► Tambah masa aktif    ${B}[088]${R} ► Backup guna Nginx"
echo -e "${B}[042]${R} ► Cek user login       ${B}[089]${R} ► Autoackup guna Email"
echo -e "                             ${B}[090]${R} ► Autobackup guna Nginx"
echo -e "${C}Menu Xray Vless Xtls${R}         ${B}[091]${R} ► Restore guna Email"
echo -e "${B}[043]${R} ► Membuat akaun        ${B}[092]${R} ► Restore guna Nginx"
echo -e "${B}[044]${R} ► Padam akaun"
echo -e "${B}[045]${R} ► Tambah masa akti     ${C}Lain-lain${R}"
echo -e "${B}[046]${R} ► Cek user login       ${B}[093]${R} ► Menu webmin"
echo -e "                             ${B}[094]${R} ► Menu set autoreboot"
echo -e "${C}Menu Xray Vless${R}              ${B}[095]${R} ► Limit Speed"
echo -e "${B}[047]${R} ► Membuat akaun        ${B}[096]${R} ► Semak penggunaan Ram"
echo -e "${B}[048]${R} ► Padam akaun          ${B}[097]${R} ► Speedtest VPS"
echo -e "${B}[049]${R} ► Tambah masa aktif    ${B}[098]${R} ► Info sistem"
echo -e "${B}[050]${R} ► Cek user login       ${B}[099]${R} ► Info autoskrip"
echo -e "                             ${B}[100]${R} ► Status sistem"
echo -e "${C}Menu Xray Vmess${R}              ${B}[101]${R} ► Restart semua servis"
echo -e "${B}[051]${R} ► Membuat akaun        ${B}[102]${R} ► Reboot VPS"
echo -e "${B}[052]${R} ► Padam akaun          ${B}[103]${R} ► Update skrip & sistem"
echo -e "${B}[053]${R} ► Tambah masa aktif    ${B}[104]${R} ► Tukar Style Menu"
echo -e "${B}[054]${R} ► Cek user login       ${B}[105]${R} ► Keluar"
echo -e ""
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
read -p "► Sila masukkan nombor pilihan anda [1-105]: " menu
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
add-l2tp
;;
13)
del-l2tp
;;
14)
renew-l2tp
;;
15)
add-sstp
;;
16)
del-sstp
;;
17)
renew-sstp
;;
18)
cek-sstp
;;
19)
add-pptp
;;
20)
del-pptp
;;
21)
renew-pptp
;;
22)
cek-pptp
;;
23)
add-ssr
;;
24)
del-ssr
;;
25)
renew-ssr
;;
26)
ssr
;;
27)
add-ss
;;
28)
del-ss
;;
29)
renew-ss
;;
30)
cek-ss
;;
31)
add-wg
;;
32)
del-wg
;;
33)
renew-wg
;;
34)
cek-wg
;;
35)
add-v2rayless
;;
36)
del-v2rayless
;;
37)
renew-v2rayless
;;
38)
cek-v2rayless
;;
39)
add-v2rayvmess
;;
40)
del-v2rayvmess
;;
41)
renew-v2rayvmess
;;
42)
cek-v2rayvmess
;;
43)
add-xrayxtls
;;
44)
del-xrayxtls
;;
45)
renew-xrayxtls
;;
46)
cek-xrayxtls
;;
47)
add-xrayvless
;;
48)
del-xrayvless
;;
49)
renew-xrayvless
;;
50)
cek-xrayvless
;;
51)
add-xrayvmess
;;
52)
del-vxrayvmess
;;
53)
renew-xrayvmess
;;
54)
cek-xrayvmess
;;
55)
add-xraygrpc
;;
56)
del-xraygrpc
;;
57)
renew-xraygrpc
;;
58)
cek-xraygrpc
;;
59)
add-v2raytrojan
;;
60)
del-v2raytrojan
;;
61)
renew-v2raytrojan
;;
62)
cek-v2raytrojan
;;
63)
add-xraytrojan
;;
64)
del-xraytrojan
;;
65)
renew-xraytrojan
;;
66)
cek-xraytrojan
;;
67)
add-xraytrojangrpc
;;
68)
del-xraytrojangrpc
;;
69)
renew-xraytrojangrpc
;;
70)
cek-xraytrojangrpc
;;
71)
add-host
;;
72)
add-cff
;;
73)
add-dom
;;
74)
add-cfh
;;
75)
certv2ray
;;
76)
port-ovpn
;;
77)
port-stunnel4
;;
78)
port-squid
;;
79)
port-sstp
;;
80)
port-wg
;;
81)
port-v2rayvless
;;
82)
port-v2rayvmess
;;
83)
port-xrayvless
;;
84)
port-xrayvmess
;;
85)
port-xraygrpc
;;
86)
port-trojan
;;
87)
restoreemail
;;
88)
backupnginx
;;
89)
autobackupemail
;;
90)
autobackupnginx
;;
91)
restoreemail
;;
92)
restorenginx
;;
93)
menu-webmin
;;
94)
menu-autoreboot
;;
95)
limit-speed
;;
96)
ram
;;
97)
speedtest
;;
98)
info-system
;;
99)
info-script
;;
100)
running
;;
101)
restart
;;
102)
reboot
;;
103)
update
;;
104)
menu-changemenu
;;
105)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu
;;
esac
