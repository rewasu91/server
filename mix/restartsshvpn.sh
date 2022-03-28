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

clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                      Servis Restart                      ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[1]${R} ► Restart Semua Servis"
echo -e "${B}[2]${R} ► Restart OpenSSH"
echo -e "${B}[3]${R} ► Restart Dropbear"
echo -e "${B}[4]${R} ► Restart Stunnel4"
echo -e "${B}[5]${R} ► Restart OpenVPN"
echo -e "${B}[6]${R} ► Restart Squid"
echo -e "${B}[7]${R} ► Restart Nginx"
echo -e "${B}[8]${R} ► Restart Badvpn"
echo -e "${B}[9]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "    ► Sila masukkan nombor pilihan anda [1-9]: " Restart
echo -e ""
sleep 1
clear
case $Restart in
                1)
                clear
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
                clear
                echo -e ""
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e "${B1}             Berjaya Restart Semua Servis!                ${R}"
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;
                2)
                clear
                /etc/init.d/ssh restart
                clear
                echo -e ""
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e "${B1}              Berjaya Restart SSH Servis!                 ${R}"
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;
                3)
                clear
                /etc/init.d/dropbear restart
                clear
                echo -e ""
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e "${B1}           Berjaya Restart Dropbear Servis!               ${R}"
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;
                4)
                clear
                /etc/init.d/stunnel4 restart
                clear
                echo -e ""
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e "${B1}            Berjaya Restart Stunnel4 Servis!              ${R}"
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                clear
                echo -e ""
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e "${B1}            Berjaya Restart OpenVPN Servis!               ${R}"
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;
                6)
                clear
                /etc/init.d/squid restart
                clear
                echo -e ""
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e "${B1}            Berjaya Restart Squid3 Servis!                ${R}"
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                clear
                echo -e ""
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e "${B1}             Berjaya Restart Nginx Servis!                ${R}"
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;
                8)
                clear
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
                clear
                echo -e ""
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e "${B1}            Berjaya Restart BadVPN Servis!                ${R}"
                echo -e "${B}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;                          
                9)
                cd
                clear
                ;;
                *)
                echo " Sila masukkan nombor yang betul!"
                sleep 1
                restart
                ;;
                esac
