#!/bin/bash

apt update
apt install shadowsocks-libev

port=$1
password=${2}

cat <<EOF > /etc/shadowsocks-libev/config.json
{
    "server":["0.0.0.0","::"],
    "server_port":${port},
    "password":"${password}",
    "timeout":60,
    "method":"aes-128-gcm",
    "fast_open": true,
}
EOF

systemctl restart shadowsocks-libev
