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
cek=$(grep -c -E "^# BEGIN_Backup" /etc/crontab)

if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
function start() {
cat << EOF >> /etc/crontab
# BEGIN_Backup
5 0 * * * root backupnginx
# END_Backup
EOF
service cron restart
sleep 1
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}          Autobackup Fail Sedang Dijalankan               ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "► Sila Tunggu.."
sleep 2
echo -e ""
echo -e "► Autobackup berjaya ditetapkan!"
echo -e "► Data akan dibackup secara automatik pada pukul 12.05pagi GMT +7!"
echo -e ""
sleep 2
exit 0
}
function stop() {
email=$(cat /home/email)
sed -i "/^$email/d" /home/email
sed -i "/^# BEGIN_Backup/,/^# END_Backup/d" /etc/crontab
service cron restart
sleep 1
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}         Autobackup Fail Sedang Dihentikan                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e"► Sila Tunggu.."
sleep 2
echo -e ""
echo -e "► Autobackup telah dihentikan!"
echo -e ""
exit 0
}
clear
echo -e ""
echo -e ""
cowsay -f ghostbusters "SELAMAT DATANG BOSKU."
echo -e ""
figlet -k '         KAIZEN'
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}             Autobackup Fail Melalui Nginx                ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "► Status $sts"
echo -e "${B}[01]${R} ► Mulakan autobackup"
echo -e "${B}[02]${R} ► Matikan autobackup"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Sila tekan CTRL+C untuk keluar"
read -rp "► Sila masukkan nombor pilihan anda [1-2] " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
else
clear
echo -e ""
echo " Sila masukkan nombor yang betul!"
sleep 1
autobackupnginx
fi
