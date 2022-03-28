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
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Menu Set Autoreboot                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "${B}[01]${R} ► Autoreboot setiap 30 minit"
echo -e "${B}[02]${R} ► Autoreboot setiap 1 jam"
echo -e "${B}[03]${R} ► Autoreboot setiap 12 jam"
echo -e "${B}[04]${R} ► Autoreboot setiap 24 jam"
echo -e "${B}[05]${R} ► Autoreboot setiap 1 minggu"
echo -e "${B}[06]${R} ► Autoreboot setiap 1 bulan"
echo -e "${B}[07]${R} ► Kembali ke Menu Utama"
echo -e "${B}[08]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
read -p "     ► Sila masukkan nombor pilihan anda [1-8]: " menuautoreboot
echo -e ""
case $menuautoreboot in
1)
echo "*/30 * * * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Maklumat Autoreboot                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Autoreboot telah berjaya ditetapkan setiap 30 minit!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
;;
2)
echo "0 * * * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Maklumat Autoreboot                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Autoreboot telah berjaya ditetapkan setiap 1 jam!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
;;
3)
echo "0 */12 * * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Maklumat Autoreboot                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Autoreboot telah berjaya ditetapkan setiap 12 jam!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
;;
4)
echo "0 0 * * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Maklumat Autoreboot                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Autoreboot telah berjaya ditetapkan setiap 24 jam!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
;;
5)
echo "0 0 */7 * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Maklumat Autoreboot                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Autoreboot telah berjaya ditetapkan setiap 1 minggu!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
;;
6)
echo "0 0 1 * * root /usr/bin/reboot" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                  Maklumat Autoreboot                     ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Autoreboot telah berjaya ditetapkan setiap 1 bulan!"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
;;
7)
menu
;;
8)
cd
clear
;;
*)
echo " Sila masukkan nombor yang betul!"
sleep 1
menu-autoreboot
;;
esac
