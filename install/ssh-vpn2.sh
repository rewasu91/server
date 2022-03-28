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

clear

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=MY
state=Sabah
locality=Malaysia
organization=kaizenvpn.xyz
organizationalunit=kaizenvpn.xyz
commonname=kaizenvpn.xyz
email=kaizen@gmail.com

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/rewasu91/server/main/mix/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
su -s /bin/bash -c '/usr/bin/b &' root
feedback=$? 2>/dev/null
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# Install Requirements Tools
apt install ruby -y
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile

# install webserver
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://raw.githubusercontent.com/rewasu91/server/main/mix/nginx.conf > /etc/nginx/nginx.conf
curl https://raw.githubusercontent.com/rewasu91/server/main/mix/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://raw.githubusercontent.com/rewasu91/server/main/mix/index.html"
/etc/init.d/nginx restart
cd

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/rewasu91/server/main/mix/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 2253' /etc/ssh/sshd_config
echo "
Port 22" >> /etc/ssh/sshd_config
echo "Port 42" >> /etc/ssh/sshd_config
/etc/init.d/ssh restart

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 1153"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
source /etc/os-release
OS=$ID
ver=$VERSION_ID

Check_python(){
if [[ ${OS} == "debian" ]]; then
clear
if [[ $ver == '9' ]]; then
apt -y install squid3
clear
elif [[ $ver == '10' ]]; then
apt -y install squid3
clear
elif [[ $ver == '11' ]]; then
apt -y install squid
clear
else
echo -e "Harap maaf. Version Debian ini tidak support!"
clear
fi
elif [[ ${OS} == "ubuntu" ]]; then
clear
if [[ $ver == '18.04' ]]; then
apt -y install squid3
clear
elif [[ $ver == '20.04' ]]; then
apt -y install squid3
clear
elif [[ $ver == '21.10' ]]; then
apt -y install squid
clear
else
echo -e "Harap maaf. Version Debian ini tidak support!"
clear
fi
fi
}
Check_python

wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/rewasu91/server/main/mix/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# Install SSLH
apt -y install sslh
rm -f /etc/default/sslh

# Settings SSLH
cat > /etc/default/sslh <<-END
# Default options for sslh initscript
# sourced by /etc/init.d/sslh

# Disabled by default, to force yourself
# to read the configuration:
# - /usr/share/doc/sslh/README.Debian (quick start)
# - /usr/share/doc/sslh/README, at "Configuration" section
# - sslh(8) via "kaizen sslh" for more configuration details.
# Once configuration ready, you *must* set RUN to yes here
# and try to start sslh (standalone mode only)

RUN=yes

# binary to use: forked (sslh) or single-thread (sslh-select) version
# systemd users: don't forget to modify /lib/systemd/system/sslh.service
DAEMON=/usr/sbin/sslh

DAEMON_OPTS="--user sslh --listen 0.0.0.0:440 --ssl 127.0.0.1:777 --ssh 127.0.0.1:109 --openvpn 127.0.0.1:1194 --http 127.0.0.1:8880 --pidfile /var/run/sslh/sslh.pid -n"

END

# Restart Service SSLH
service sslh restart
systemctl restart sslh
/etc/init.d/sslh restart
/etc/init.d/sslh status
/etc/init.d/sslh restart

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel
apt-get install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
[dropbear]
accept = 443
connect = 127.0.0.1:109
[dropbear]
accept = 777
connect = 127.0.0.1:22
[openvpn]
accept = 789
connect = 127.0.0.1:1194
[Stunnel]
accept = 445
connect = 700
END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://raw.githubusercontent.com/rewasu91/server/main/install/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
echo "
Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# Ganti Banner
wget -O /etc/issue.net "https://raw.githubusercontent.com/rewasu91/server/main/install/issue.net"

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin

#mix
wget -O info-system "https://raw.githubusercontent.com/rewasu91/server/main/info/info-system.sh"
wget -O info-script "https://raw.githubusercontent.com/rewasu91/server/main/info/info-script.sh"
wget -O speedtest "https://raw.githubusercontent.com/rewasu91/server/main/mix/speedtest_cli.py"
wget -O ram "https://raw.githubusercontent.com/rewasu91/server/main/mix/ram.sh"
wget -O running "https://raw.githubusercontent.com/rewasu91/server/main/mix/running.sh"
wget -O tendang "https://raw.githubusercontent.com/rewasu91/files/main/service/tendang.sh"
wget -O update "https://raw.githubusercontent.com/rewasu91/public/main/update/update.sh"
wget -O change-passwd "https://raw.githubusercontent.com/rewasu91/server/main/mix/change-passwd.sh"
wget -O autokill "https://raw.githubusercontent.com/rewasu91/server/main/mix/autokill.sh"
wget -O restartsshvpn "https://raw.githubusercontent.com/rewasu91/server/main/mix/restartsshvpn.sh"
wget -O limit-speed "https://raw.githubusercontent.com/rewasu91/server/main/mix/limit-speed.sh"
wget -O certv2ray "https://raw.githubusercontent.com/rewasu91/server/main/mix/certv2ray.sh"
wget -O restart "https://raw.githubusercontent.com/rewasu91/server/main/mix/restart.sh"
wget -O clearlog "https://raw.githubusercontent.com/rewasu91/server/main/mix/clearlog.sh"

#izin-mix
chmod +x info-system
chmod +x info-script
chmod +x speedtest
chmod +x ram
chmod +x running
chmod +x tendang
chmod +x update
chmod +x change-passwd
chmod +x autokill
chmod +x restartsshvpn
chmod +x limit-speed
chmod +x certv2ray
chmod +x restart
chmod +x clearlog

#add
wget -O add-sshvpn "https://raw.githubusercontent.com/rewasu91/server/main/add/add-sshvpn.sh"
wget -O add-trial "https://raw.githubusercontent.com/rewasu91/server/main/add/add-trial.sh"
wget -O add-cff "https://raw.githubusercontent.com/rewasu91/server/main/cf/add-cff.sh"
wget -O add-cfh "https://raw.githubusercontent.com/rewasu91/server/main/cf/add-cfh.sh"
wget -O add-dom "https://raw.githubusercontent.com/rewasu91/server/main/cf/add-dom.sh"
wget -O add-host "https://raw.githubusercontent.com/rewasu91/server/main/cf/add-host.sh"
wget -O add-v2rayvless "https://raw.githubusercontent.com/rewasu91/server/main/add/add-v2rayvless.sh"
wget -O add-v2rayvmess "https://raw.githubusercontent.com/rewasu91/server/main/add/add-v2rayvmess.sh"
wget -O add-v2raytrojan "https://raw.githubusercontent.com/rewasu91/server/main/add/add-v2raytrojan.sh"
wget -O add-xrayxtls "https://raw.githubusercontent.com/rewasu91/server/main/add/add-xrayxtls.sh"
wget -O add-xrayvless "https://raw.githubusercontent.com/rewasu91/server/main/add/add-xrayvless.sh"
wget -O add-xraygrpc "https://raw.githubusercontent.com/rewasu91/server/main/add/add-xraygrpc.sh"
wget -O add-xrayvmess "https://raw.githubusercontent.com/rewasu91/server/main/add/add-xrayvmess.sh"
wget -O add-xraytrojan "https://raw.githubusercontent.com/rewasu91/server/main/add/add-xraytrojan.sh"
wget -O add-xraytrojangrpc "https://raw.githubusercontent.com/rewasu91/server/main/add/add-xraytrojangrpc.sh"
wget -O add-l2tp "https://raw.githubusercontent.com/rewasu91/server/main/add/add-l2tp.sh"
wget -O add-pptp "https://raw.githubusercontent.com/rewasu91/server/main/add/add-pptp.sh"
wget -O add-ss "https://raw.githubusercontent.com/rewasu91/server/main/add/add-ss.sh"
wget -O add-ssr "https://raw.githubusercontent.com/rewasu91/server/main/add/add-ssr.sh"
wget -O add-sstp "https://raw.githubusercontent.com/rewasu91/server/main/add/add-sstp.sh"
wget -O add-wg "https://raw.githubusercontent.com/rewasu91/server/main/add/add-wg.sh"

#izin-add
chmod +x add-sshvpn
chmod +x add-trial
chmod +x add-cff
chmod +x add-cfh
chmod +x add-dom
chmod +x add-host
chmod +x add-v2rayvless
chmod +x add-v2rayvmess
chmod +x add-v2raytrojan
chmod +x add-xrayxtls
chmod +x add-xrayvless
chmod +x add-xrayvmess
chmod +x add-xraygrpc
chmod +x add-xraytrojan
chmod +x add-xraytrojangrpc
chmod +x add-l2tp
chmod +x add-pptp
chmod +x add-ss
chmod +x add-ssr
chmod +x add-sstp
chmod +x add-wg

#delete
wget -O del-expiresshvpn "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-expiresshvpn.sh"
wget -O del-l2tp "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-l2tp.sh"
wget -O del-pptp "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-pptp.sh"
wget -O del-ss "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-ss.sh"
wget -O del-sshvpn "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-sshvpn.sh"
wget -O del-ssr "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-ssr.sh"
wget -O del-sstp "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-sstp.sh"
wget -O del-wg "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-wg.sh"
wget -O del-v2raytrojan "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-v2raytrojan.sh"
wget -O del-v2rayvless "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-v2rayvless.sh"
wget -O del-v2rayvmess "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-v2rayvmess.sh"
wget -O del-xraygrpc "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-xraygrpc.sh"
wget -O del-xraytrojan "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-xraytrojan.sh"
wget -O del-xraytrojangrpc "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-xraytrojangrpc.sh"
wget -O del-xrayvless "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-xrayvless.sh"
wget -O del-xrayvmess "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-xrayvmess.sh"
wget -O del-xrayxtls "https://raw.githubusercontent.com/rewasu91/server/main/delete/del-xrayxtls.sh"
wget -O xp "https://raw.githubusercontent.com/rewasu91/server/main/delete/xp.sh"

#izin-delete
chmod +x del-expiresshvpn
chmod +x del-l2tp
chmod +x del-pptp
chmod +x del-ss
chmod +x del-sshvpn
chmod +x del-ssr
chmod +x del-sstp
chmod +x del-wg
chmod +x del-v2raytrojan
chmod +x del-v2rayvless
chmod +x del-v2rayvmess
chmod +x del-xraygrpc
chmod +x del-xraytrojan
chmod +x del-xraytrojangrpc
chmod +x del-xrayvless
chmod +x del-xrayvmess
chmod +x del-xrayxtls
chmod +x xp

#renew
wget -O renew-l2tp "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-l2tp.sh"
wget -O renew-pptp "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-pptp.sh"
wget -O renew-ss "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-ss.sh"
wget -O renew-sshvpn "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-sshvpn.sh"
wget -O renew-ssr "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-ssr.sh"
wget -O renew-sstp "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-sstp.sh"
wget -O renew-wg "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-wg.sh"
wget -O renew-v2raytrojan "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-v2raytrojan.sh"
wget -O renew-v2rayvless "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-v2rayvless.sh"
wget -O renew-v2rayvmess "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-v2rayvmess.sh"
wget -O renew-xraygrpc "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-xraygrpc.sh"
wget -O renew-xraytrojan "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-xraytrojan.sh"
wget -O renew-xraytrojangrpc "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-xraytrojangrpc.sh"
wget -O renew-xrayvless "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-xrayvless.sh"
wget -O renew-xrayvmess "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-xrayvmess.sh"
wget -O renew-xrayxtls "https://raw.githubusercontent.com/rewasu91/server/main/renew/renew-xrayxtls.sh"

#izin-renew
chmod +x renew-l2tp
chmod +x renew-pptp
chmod +x renew-ss
chmod +x renew-sshvpn
chmod +x renew-ssr
chmod +x renew-sstp
chmod +x renew-wg
chmod +x renew-v2raytrojan
chmod +x renew-v2rayvless
chmod +x renew-v2rayvmess
chmod +x renew-xraygrpc
chmod +x renew-xraytrojan
chmod +x renew-xraytrojangrpc
chmod +x renew-xrayvless
chmod +x renew-xrayvmess
chmod +x renew-xrayxtls

#cek
wget -O cek-lim "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-lim.sh"
wget -O cek-listmember "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-listmember.sh"
wget -O cek-login "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-login.sh"
wget -O cek-pptp "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-pptp.sh"
wget -O cek-ss "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-ss.sh"
wget -O cek-sstp "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-sstp.sh"
wget -O cek-wg "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-wg.sh"
wget -O cek-v2raytrojan "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-v2raytrojan.sh"
wget -O cek-v2rayvless "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-v2rayvless.sh"
wget -O cek-v2rayvmess "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-v2rayvmess.sh"
wget -O cek-xraygrpc "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-xraygrpc.sh"
wget -O cek-xraytrojan "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-xraytrojan.sh"
wget -O cek-xraytrojantrpc "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-xraytrojantrpc.sh"
wget -O cek-xrayvless "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-xrayvless.sh"
wget -O cek-xrayvmess "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-xrayvmess.sh"
wget -O cek-xrayxtls "https://raw.githubusercontent.com/rewasu91/server/main/cek/cek-xrayxtls.sh"

#izin-cek
chmod +x cek-lim
chmod +x cek-listmember
chmod +x cek-login
chmod +x cek-pptp
chmod +x cek-ss
chmod +x cek-sstp
chmod +x cek-wg
chmod +x cek-v2raytrojan
chmod +x cek-v2rayvless
chmod +x cek-v2rayvmess
chmod +x cek-xraygrpc
chmod +x cek-xraytrojan
chmod +x cek-xraytrojangrpc
chmod +x cek-xrayvless
chmod +x cek-xrayvmess
chmod +x cek-xrayxtls

#menu
wget -O menu "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu.sh"
wget -O menu-sshvpn "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-sshvpn.sh"
wget -O menu-l2tp "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-l2tp.sh"
wget -O menu-sstp "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-sstp.sh"
wget -O menu-pptp "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-pptp.sh"
wget -O menu-ssr "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-ssr.sh"
wget -O menu-ss "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-ss.sh"
wget -O menu-wg "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-wg.sh"
wget -O menu-system "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-system.sh"
wget -O menu-v2ray "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-v2ray.sh"
wget -O menu-xray "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-xray.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-trojan.sh"
wget -O menu-changemenu "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-changemenu.sh"
wget -O menu-port "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-port.sh"
wget -O menu-domain "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-domain.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-webmin.sh"
wget -O menu-autoreboot "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-autoreboot.sh"
wget -O menu-backuprestore "https://raw.githubusercontent.com/rewasu91/server/main/menu/menu-backuprestore.sh"

#izin-menu
chmod +x menu
chmod +x menu-sshvpn
chmod +x menu-l2tp
chmod +x menu-sstp
chmod +x menu-pptp
chmod +x menu-ssr
chmod +x menu-ss
chmod +x menu-wg
chmod +x menu-system
chmod +x menu-v2ray
chmod +x menu-xray
chmod +x menu-trojan
chmod +x menu-changemenu
chmod +x menu-port
chmod +x menu-domain
chmod +x menu-webmin
chmod +x menu-autoreboot
chmod +x menu-backuprestore

#port
wget -O port-ovpn "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-ovpn.sh"
wget -O port-stunnel4 "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-stunnel4.sh"
wget -O port-squid "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-squid.sh"
wget -O port-sstp "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-sstp.sh"
wget -O port-wg "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-wg.sh"
wget -O port-v2rayvless "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-v2rayvless.sh"
wget -O port-v2rayvmess "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-v2rayvmess.sh"
wget -O port-xrayvless "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-xrayvless.sh"
wget -O port-xrayvmess "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-xrayvmess.sh"
wget -O port-xraygrpc "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-xraygrpc.sh"
wget -O port-trojan "https://raw.githubusercontent.com/rewasu91/server/main/editport/port-trojan.sh"

#izin-port
chmod +x port-ovpn
chmod +x port-stunnel4
chmod +x port-squid
chmod +x port-sstp
chmod +x port-wg
chmod +x port-v2rayvless
chmod +x port-v2rayvmess
chmod +x port-xrayvless
chmod +x port-xrayvmess
chmod +x port-xraygrpc
chmod +x port-trojan

echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp && del-expiresshvpn" >> /etc/crontab

# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/sslh restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/fail2ban restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
