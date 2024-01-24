#!/usr/bin/env bash
#
mkdir -p /etc/systemd/resolved.conf.d
cat > /etc/systemd/resolved.conf.d/10-nameserver.conf <<EOF
[Resolve]
DNS=192.168.89.64
EOF

mkdir -p /etc/systemd/network.conf.d
cat > /etc/systemd/network.conf.d/10-eth0-dns.conf <<EOF
[Match]
Name=eth0

[Network]
DNS=127.0.0.1

[DHCPv4]
UseDNS=false
EOF

systemctl daemon-reload
systemctl restart systemd-resolved
systemctl restart systemd-networkd

ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

resolvectl status
