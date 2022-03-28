#!/bin/bash

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

MYIP=$(curl -sS ipv4.icanhazip.com)
# Getting Proxy Template
wget -q -O /usr/local/bin/websocket https://raw.githubusercontent.com/rewasu91/vps/main/websocket/websocket.py
chmod +x /usr/local/bin/websocket

# Installing Service
cat > /etc/systemd/system/websocket.service << END
[Unit]
Description=Python Proxy Mod By Kaizen
Documentation=https://github.com/rewasu91
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/websocket 8880
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/rewasu91/vps/main/websocket/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn

# Installing Service
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=SSHWS
Documentation=https://github.com/rewasu91
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Installing Service ws-stunnel
wget -q -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/rewasu91/vps/main/websocket/ws-stunnel
chmod +x /usr/local/bin/ws-stunnel

# Create system Service ws-stunnel
cat > /etc/systemd/system/ws-stunnel.service <<END
[Unit]
Description=SSHSSl
Documentation=https://github.com/rewasu91
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-stunnel
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable websocket
systemctl restart websocket
systemctl daemon-reload
systemctl enable ws-ovpn
systemctl restart ws-ovpn
systemctl daemon-reload
systemctl enable ws-stunnel
systemctl restart ws-stunnel
