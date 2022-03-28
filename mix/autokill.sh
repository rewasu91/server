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

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                      Setup Autokill                      ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "► Status Autokill $sts        "
echo -e "${B}[1]${R} ► AutoKill setiap 5 minit"
echo -e "${B}[2]${R} ► AutoKill setiap 10 minit"
echo -e "${B}[3]${R} ► AutoKill setiap 15 minit"
echo -e "${B}[4]${R} ► Matikan fungsi AutoKill/MultiLogin"
echo -e "${B}[5]${R} ► Keluar"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"                                                                                                       
echo -e ""
read -p "► Sila pilih nombor anda [1-5] :  " AutoKill
echo -e ""
case $AutoKill in
                1)
                echo -e ""
                clear
				read -p "► Sila masukkan jumlah Multilogin yang dibenarkan: " max
				echo -e ""
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                clear
                echo -e ""
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e "${D1}                 Autokill Berjaya Dipasang                ${R}"
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e "► Jumlah Multilogin yang dibenarkan  : $max"
                echo -e "► Autokill setiap                    : 5 Minutes"      
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e ""                                                                
                ;;
                2)
                echo -e ""
                clear
				read -p "► Sila masukkan jumlah Multilogin yang dibenarkan: " max
				echo -e ""
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                clear
                echo -e ""
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e "${D1}                 Autokill Berjaya Dipasang                ${R}"
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e "► Jumlah Multilogin yang dibenarkan  : $max"
                echo -e "► Autokill setiap                    : 10 Minutes"      
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;
                3)
                echo -e ""
                clear
				read -p "► Sila masukkan jumlah Multilogin yang dibenarkan: " max
				echo -e ""
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                clear
                echo -e ""
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e "${D1}                 Autokill Berjaya Dipasang                ${R}"
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e "► Jumlah Multilogin yang dibenarkan  : $max"
                echo -e "► Autokill setiap                    : 15 Minutes"      
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                exit
                ;;
                4)
                clear
                echo > /etc/cron.d/tendang
                echo -e ""
                clear
                echo -e ""
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e "${D1}                 Autokill Berjaya Ditutup                 ${R}"
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e "► Autokill telah ditutup"     
                echo -e "${D}——————————————————————————————————————————————————————————${R}"
                echo -e ""
                ;;
                5)
                cd
                clear
                ;;
                *)
                echo " Sila masukkan nombor yang betul!"
                sleep 1
                autokill
                ;;
                esac
