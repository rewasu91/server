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
echo -e "Menu SSH & OpenVPN           Menu Xray Grpc"
echo -e "[001] ► Buat akaun           [055] ► Membuat akaun"
echo -e "[002] ► Buat akaun trial     [056] ► Padam akaun"
echo -e "[003] ► Ganti password       [057] ► Tambah masa aktif"
echo -e "[004] ► Senarai akaun        [058] ► Cek user login"
echo -e "[005] ► Senarai login"
echo -e "[006] ► Tambah masa aktif    Menu Trojan V2ray"
echo -e "[007] ► Padam akaun          [059] ► Membuat akaun"
echo -e "[008] ► Padam akaun expire   [060] ► Padam akaun"
echo -e "[009] ► Setup Autokill SSH   [061] ► Tambah masa aktif"
echo -e "[010] ► Tunjuk Multi Login   [062] ► Cek user login"
echo -e "[011] ► Restart servis"
echo -e "                             Menu Trojan Xray"
echo -e "Menu L2TP                    [063] ► Membuat akaun"
echo -e "[012] ► Membuat akaun        [064] ► Padam akaun"
echo -e "[013] ► Padam akaun          [065] ► Tambah masa aktif"
echo -e "[014] ► Tambah masa aktif    [066] ► Cek user login"
echo -e ""
echo -e "Menu SSTP                    Menu Trojan Go"
echo -e "[015] ► Membuat akaun        [067] ► Membuat akaun"
echo -e "[016] ► Padam akaun          [068] ► Padam akaun"
echo -e "[017] ► Tambah masa aktif    [069] ► Tambah masa aktif"
echo -e "[018] ► Cek user login       [070] ► Cek user login"
echo -e ""
echo -e "Menu PPTP                    Menu Trojan Xray Grpc"
echo -e "[019] ► Membuat akaun        [071] ► Membuat akaun"
echo -e "[020] ► Padam akaun          [072] ► Padam akaun"
echo -e "[021] ► Tambah masa aktif    [073] ► Tambah masa aktif"
echo -e "[022] ► Cek user login       [074] ► Cek user login"
echo -e ""
echo -e "Menu SSR"
echo -e "[023] ► Membuat akaun        Menu Sistem"
echo -e "[024] ► Padam akaun"
echo -e "[025] ► Tambah masa aktif    Untuk yang tiada akaun Cloudflare"
echo -e "[026] ► Menu SSR yang lain   [075] ► Tambah/Tukar domain"
echo -e ""
echo -e "Menu Shadowsocks             Untuk yang ada akaun Cloudflare"
echo -e "[027] ► Membuat akaun        [076] ► Tambah ID Cloudflare"
echo -e "[028] ► Padam akaun          [077] ► Tambah Subdomain Cloudflare"
echo -e "[029] ► Tambah masa aktif    [078] ► Pointing bug ke IP lain"
echo -e "[030] ► Cek user login       [079] ► Renew certificate"
echo -e ""
echo -e "Menu Wireguard               Menu Tukar Port Servis"
echo -e "[031] ► Membuat akaun        [080] ► Tukar port OpenVPN"
echo -e "[032] ► Padam akaun          [081] ► Tukar port Stunnel4"
echo -e "[033] ► Tambah masa aktif    [082] ► Tukar port Squid"
echo -e "[034] ► Cek user login       [083] ► Tukar port SSTP"
echo -e "                             [084] ► Tukar port Wireguard"
echo -e "Menu V2ray Vless             [085] ► Tukar port V2ray Vless"
echo -e "[035] ► Membuat akaun        [086] ► Tukar port V2ray Vmess"
echo -e "[036] ► Padam akaun          [087] ► Tukar port Xray Vless"
echo -e "[037] ► Tambah masa aktif    [088] ► Tukar port Xray Vmess"
echo -e "[038] ► Cek user login       [089] ► Tukar port Xray Grpc"
echo -e "                             [090] ► Tukar port Trojan"
echo -e "Menu V2ray Vmess"
echo -e "[039] ► Membuat akaun        Menu Backup & Restore"
echo -e "[040] ► Padam akaun          [091] ► Backup guna Email"
echo -e "[041] ► Tambah masa aktif    [092] ► Backup guna Nginx"
echo -e "[042] ► Cek user login       [093] ► Autoackup guna Email"
echo -e "                             [094] ► Autobackup guna Nginx"
echo -e "Menu Xray Vless Xtls         [095] ► Restore guna Email"
echo -e "[043] ► Membuat akaun        [096] ► Restore guna Nginx"
echo -e "[044] ► Padam akaun"
echo -e "[045] ► Tambah masa akti     Lain-lain"
echo -e "[046] ► Cek user login       [097] ► Menu webmin"
echo -e "                             [098] ► Menu set autoreboot"
echo -e "Menu Xray Vless              [099] ► Limit Speed"
echo -e "[047] ► Membuat akaun        [100] ► Semak penggunaan Ram"
echo -e "[048] ► Padam akaun          [101] ► Speedtest VPS"
echo -e "[049] ► Tambah masa aktif    [102] ► Info sistem"
echo -e "[050] ► Cek user login       [103] ► Info autoskrip"
echo -e "                             [104] ► Status sistem"
echo -e "Menu Xray Vmess              [105] ► Restart semua servis"
echo -e "[051] ► Membuat akaun        [106] ► Reboot VPS"
echo -e "[052] ► Padam akaun          [107] ► Update skrip & sistem"
echo -e "[053] ► Tambah masa aktif    [108] ► Tukar Style Menu"
echo -e "[054] ► Cek user login       [109] ► Keluar"
echo -e ""
echo -e "${D}————————————————————————————————————————————————————————————————${R}"
read -p "► Sila masukkan nombor pilihan anda [1-109]: " menu
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
add-trgo
;;
68)
del-trgo
;;
69)
renew-trgo
;;
70)
cek-trgo
;;
71)
add-xraytrojangrpc
;;
72)
del-xraytrojangrpc
;;
73)
renew-xraytrojangrpc
;;
74)
cek-xraytrojangrpc
;;
75)
add-host
;;
76)
add-cff
;;
77)
add-dom
;;
78)
add-cfh
;;
79)
certv2ray
;;
80)
port-ovpn
;;
81)
port-stunnel4
;;
82)
port-squid
;;
83)
port-sstp
;;
84)
port-wg
;;
85)
port-v2rayvless
;;
86)
port-v2rayvmess
;;
87)
port-xrayvless
;;
88)
port-xrayvmess
;;
89)
port-xraygrpc
;;
90)
port-trojan
;;
91)
restoreemail
;;
92)
backupnginx
;;
93)
autobackupemail
;;
94)
autobackupnginx
;;
95)
restoreemail
;;
96)
restorenginx
;;
97)
menu-webmin
;;
98)
menu-autoreboot
;;
99)
lmit-speed
;;
100)
ram
;;
101)
speedtest
;;
102)
info-system
;;
103)
info-script
;;
104)
running
;;
105)
restart
;;
106)
reboot
;;
107)
update
;;
108)
menu-changemenu
;;
109)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu
;;
esac
