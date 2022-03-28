#!/bin/bash

apt install rclone -y
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/rewasu91/server/main/mix/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user bckupvpns@gmail.com
from bckupvpns@gmail.com
password Yangbaru1 
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackupemail "https://raw.githubusercontent.com/rewasu91/server/main/backup/autobackupemail.sh"
wget -O autobackupnginx "https://raw.githubusercontent.com/rewasu91/server/main/backup/autobackupnginx.sh"
wget -O backupemail "https://raw.githubusercontent.com/rewasu91/server/main/backup/backupemail.sh"
wget -O backupnginx "https://raw.githubusercontent.com/rewasu91/server/main/backup/backupnginx.sh"
wget -O restoreemail "https://raw.githubusercontent.com/rewasu91/server/main/backup/restoreemail.sh"
wget -O restorenginx "https://raw.githubusercontent.com/rewasu91/server/main/backup/restorepnginx.sh"
wget -O bckp "https://raw.githubusercontent.com/rewasu91/server/main/backup/bckp.sh"
chmod +x backupemail
chmod +x backupnginx
chmod +x autobackupemail
chmod +x autobackupnginx
chmod +x restoreemail
chmod +x restorenginx
chmod +x bckp

cd
rm -f /root/set-br.sh
