#!/bin/bash

systemctl stop v2ray@none.service
systemctl stop v2ray@vless.service
systemctl stop v2ray@vnone.service
systemctl stop v2ray@mkcp.service
systemctl stop v2ray.service
systemctl stop trojan.service
systemctl stop xrayvmesstls
systemctl stop xrayvmessnonetls
systemctl stop xrayvmessmkcp
systemctl stop xrayvlesstls
systemctl stop xrayvlessnonetls
systemctl stop xrayxtls
systemctl stop xraytrojan
systemctl stop xrayvmessgrpc
systemctl stop xrayvlessgrpc
systemctl stop xraytrojangrpc
systemctl stop trojan-go

domain=$(cat /etc/xray/domain)
cd /root/
wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --set-default-ca --server letsencrypt
bash acme.sh --register-account -m kai@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key 
