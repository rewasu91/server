#!/bin/bash

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

#!/bin/bash

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

clear
echo -e ""
echo -e ""
echo -e "     —————————————————————————————————————————————————————————"
echo -e "     *             Autoskrip VPS Premium KaizenVPN           *"
echo -e "     —————————————————————————————————————————————————————————"
echo -e "     *                                                       *"
echo -e "     * Servis Yang Tersedia                                  *"
echo -e "     * A - SSH, Dropbear, OpenVPN, Squid                     *"
echo -e "     * B - Websocket, Servis OHP                             *"
echo -e "     * C - L2TP, Servis SSTP, Servis PPTP                    *"
echo -e "     * D - Wireguard, Servis Shadowsocks & SSR               *"
echo -e "     * E - V2ray Vmess/Vless/Trojan (Ws)                     *"
echo -e "     * F - Xray Vmess/Vless/Trojan (Ws, Tcp, Kcp, Xtls, Grpc)*"
echo -e "     * G - Trojan Go                                         *"
echo -e "     —————————————————————————————————————————————————————————"
echo -e "     *                                                       *"
echo -e "     * Sila pilih pakej servis yang anda ingin pasang:-      *"
echo -e "     *                                                       *"
echo -e "     * Semua Servis                                          *"
echo -e "     * [1] Pakej 1 ► [A,B,C,D,E,F,G]                         *"
echo -e "     *                                                       *"
echo -e "     * Semua Servis Kecuali Trojan Go                        *"
echo -e "     * [2] Pakej 2 ► [A,B,C,D,E,F]                           *"
echo -e "     *                                                       *"
echo -e "     * Semua Servis Kecuali Trojan Go, L2TP, SSTP, PPTP      *"
echo -e "     * [3] Pakej 3 ► [A,B,D,E,F] (Hot Pick)                  *"
echo -e "     *                                                       *"
echo -e "     * Servis Termasuk L2TP, SSTP, PPTP, Tidak Termasuk V2ray*"
echo -e "     * [4] Pakej 4 ► Core Xray [A,B,C,D,F]                   *"
echo -e "     * [5] Pakej 5 ► Core Xray + Trojan Go [A,B,C,D,F,G]     *"
echo -e "     *                                                       *"
echo -e "     * Servis Tidak Termasuk L2TP, SSTP, PPTP, & V2ray       *"
echo -e "     * [6] Pakej 6 ► Core Xray [A,B,D,F] (Hot Pick)          *"
echo -e "     * [7] Pakej 7 ► Core Xray + Trojan Go [A,B,D,F,G]       *"
echo -e "     —————————————————————————————————————————————————————————"
read -p "     ► Sila masukkan nombor pilihan anda [1-7]: " pilihan
echo -e ""

case $pilihan in
1)
clear
wget https://raw.githubusercontent.com/rewasu91/server/main/pakej/pakej1.sh && chmod +x pakej1.sh && ./pakej1.sh
;;
2)
clear
wget https://raw.githubusercontent.com/rewasu91/server/main/pakej/pakej2.sh && chmod +x pakej2.sh && ./pakej2.sh
;;
3)
clear
wget https://raw.githubusercontent.com/rewasu91/server/main/pakej/pakej3.sh && chmod +x pakej3.sh && ./pakej3.sh
;;
4)
clear
wget https://raw.githubusercontent.com/rewasu91/server/main/pakej/pakej4.sh && chmod +x pakej4.sh && ./pakej4.sh
;;
5)
clear
wget https://raw.githubusercontent.com/rewasu91/server/main/pakej/pakej5.sh && chmod +x pakej5.sh && ./pakej5.sh
;;
6)
clear
wget https://raw.githubusercontent.com/rewasu91/server/main/pakej/pakej6.sh && chmod +x pakej6.sh && ./pakej6.sh
;;
*)
7)
clear
wget https://raw.githubusercontent.com/rewasu91/server/main/pakej/pakej7.sh && chmod +x pakej7.sh && ./pakej7.sh
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
setup
;;
esac
