#!/usr/bin/bash
#
wget https://github.com/coredns/coredns/releases/download/v1.10.0/coredns_1.10.0_linux_amd64.tgz
tar -zxf coredns_1.10.0_linux_amd64.tgz
chmod +x coredns
mv coredns /usr/local/bin/
mkdir /etc/coredns

useradd -ms /sbin/nologin -c 'coredns user' coredns 

cat > /etc/coredns/Corefile <<EOF
.:53 {
    forward . tls://8.8.8.8 tls://8.8.4.4 tls://2001:4860:4860::8888 tls://2001:4860:4860::8844
    cache
    log
    acl {
        allow net 10.200.200.0/24
        allow net fd42:42:42::0/128
        block
    }
}
EOF

cat > /etc/systemd/system/coredns.service <<EOF
[Unit]
Description=CoreDNS DNS server
Documentation=https://coredns.io
After=network.target

[Service]
PermissionsStartOnly=true
LimitNOFILE=1048576
LimitNPROC=512
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_BIND_SERVICE
NoNewPrivileges=true
User=coredns
WorkingDirectory=/home/coredns
ExecStart=/usr/local/bin/coredns -conf=/etc/coredns/Corefile
ExecReload=/bin/kill -SIGUSR1 $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

systemctl stop systemd-resolved
systemctl disable systemd-resolved
systemctl start coredns
systemctl enable coredns

