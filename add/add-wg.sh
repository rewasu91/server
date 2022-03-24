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

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

# Load params
source /etc/wireguard/params
source /var/lib/Kaizen/ipvps.conf
if [[ "$IP" = "" ]]; then
SERVER_PUB_IP=$(wget -qO- ipinfo.io/ip);
else
SERVER_PUB_IP=$IP
fi
source /var/lib/Kaizen/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
portwg="$(cat /etc/wireguard/params | grep SERVER_PORT | sed s'/SERVER_PORT=//g')"
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}               Membuat Akaun Wireguard                    ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
until [[ ${CLIENT_NAME} =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "► Sila masukkan Username  : " -e CLIENT_NAME
    until [[ ${CLIENT_NAME} =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
	  read -rp "Username : " -e CLIENT_NAME    
		CLIENT_EXISTS=$(grep -w $CLIENT_NAME /etc/wireguard/wg0.conf | wc -l)
		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "► Username sudah berdaftar, sila pilih Username yang lain."
			exit 1
		fi
done
done
echo "IPv4 Detected"
ENDPOINT="$SERVER_PUB_IP:$SERVER_PORT"
WG_CONFIG="/etc/wireguard/wg0.conf"
LASTIP=$( grep "/32" $WG_CONFIG | tail -n1 | awk '{print $3}' | cut -d "/" -f 1 | cut -d "." -f 4 )
if [[ "$LASTIP" = "" ]]; then
CLIENT_ADDRESS="10.66.66.2"
else
CLIENT_ADDRESS="10.66.66.$((LASTIP+1))"
fi

# Google DNS by default
CLIENT_DNS_1="8.8.8.8"

CLIENT_DNS_2="8.8.4.4"
MYIP=$(wget -qO- ifconfig.co);
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# Generate key pair for the client
CLIENT_PRIV_KEY=$(wg genkey)
CLIENT_PUB_KEY=$(echo "$CLIENT_PRIV_KEY" | wg pubkey)
CLIENT_PRE_SHARED_KEY=$(wg genpsk)

# Create client file and add the server as a peer
echo "[Interface]
PrivateKey = $CLIENT_PRIV_KEY
Address = $CLIENT_ADDRESS/24
DNS = $CLIENT_DNS_1,$CLIENT_DNS_2

[Peer]
PublicKey = $SERVER_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
Endpoint = $ENDPOINT
AllowedIPs = 0.0.0.0/0,::/0" >>"$HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf"

# Add the client as a peer to the server
echo -e "### Client $CLIENT_NAME $exp
[Peer]
PublicKey = $CLIENT_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
AllowedIPs = $CLIENT_ADDRESS/32" >>"/etc/wireguard/$SERVER_WG_NIC.conf"
systemctl restart "wg-quick@$SERVER_WG_NIC"
cp $HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf /home/vps/public_html/$CLIENT_NAME.conf
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}                Maklumat Akaun Wireguard                  ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
echo -e "► User  		: $CLIENT_NAME"
echo -e "► Port Wireguard  	: $portwg"
echo -e "► Dibuat pada  	: $hariini"
echo -e "► Expired pada  	: $exp"
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Link Wireguard	: http://$MYIP:89/$CLIENT_NAME.conf"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
rm -f /root/wg0-client-$CLIENT_NAME.conf
