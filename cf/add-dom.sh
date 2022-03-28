#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
clear
source /root/mail.conf
source /root/domain
source /etc/xray/domain
DOMAIN=$host
CF_ID=$email
CF_KEY=$key
set -euo pipefail
IP=$(wget -qO- ifconfig.me/ip);
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}            Menambah Subdomain Cloudflare                 ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "
read -p "► Sila masukan Subdomain anda :" sub
echo -e "
echo "Updating DNS for ${sub}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${sub}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${sub}'","content":"'${IP}'","ttl":120,"proxied":false}')
rm -f /var/lib/crot/ipvps.conf
rm -f /root/domain
rm -f /etc/xray/domain
mkdir /etc/xray
mkdir /var/lib/crot;
echo -e ""
read -p "► Sila masukan Domain anda sekali lagi :" dom  
host=$(${sub}.${dom})
echo "IP=$host" >> /var/lib/crot/ipvps.conf
echo "$host" >> /etc/xray/domain
echo "$host" >> /root/domain
clear
echo -e ""
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "${D1}           Maklumat Subdomain Cloudflare Baru             ${R}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e "► Domain   : ${host}"
echo -e "${D}——————————————————————————————————————————————————————————${R}"
echo -e ""
