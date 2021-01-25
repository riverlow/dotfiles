#!/bin/bash

username="${1}"
password="${2}"
homedir=/home/${username}
sshkeyfile="id_rsa.pub"

# update system
[ -f /etc/apt/sources.list.d/busterbackports.list ] && /bin/rm -f /etc/apt/sources.list.d/busterbackports.list
echo 'deb http://deb.debian.org/debian buster-backports main' > /etc/apt/sources.list.d/busterbackports.list
apt-get update && apt-get -y upgrade

# install fish
apt-get -y install fish

# create user
useradd -ms /bin/fish ${username}
echo "${username}:${newpasswd}" | chpasswd

# config sudoers
echo "${username}    ALL=(ALL:ALL) ALL" >> /etc/sudoers

# config ssh
mkdir -p $homedir/.ssh;
[ -f $homedir/.ssh/authorized_keys ] && /bin/rm -f $homedir/.ssh/authorized_keys
cat $sshkeyfile >> $homedir/.ssh/authorized_keys
chmod 700 $homedir/.ssh;
chmod 600 $homedir/.ssh/authorized_keys;
chown -R $username:$username $homedir/.ssh

sed -i '/^Port.*/d' /etc/ssh/sshd_config
sed -i '/^PermitRootLogin.*/d' /etc/ssh/sshd_config
sed -i '/^PubkeyAuthentication.*/d' /etc/ssh/sshd_config
sed -i '/^PasswordAuthentication.*/d' /etc/ssh/sshd_config

echo 'Port 26271' >> /etc/ssh/sshd_config
echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config
echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config

systemctl restart sshd

# Optimize network

[ -f /etc/sysctl.d/local.conf ] && /bin/rm -f /etc/sysctl.d/local.conf
cat <<EOF >> /etc/sysctl.d/local.conf
# max open files
fs.file-max = 1024000
# max read buffer
net.core.rmem_max = 67108864
# max write buffer
net.core.wmem_max = 67108864
# default read buffer
net.core.rmem_default = 65536
# default write buffer
net.core.wmem_default = 65536
# max processor input queue
net.core.netdev_max_backlog = 4096
# max backlog
net.core.somaxconn = 4096

# resist SYN flood attacks
net.ipv4.tcp_syncookies = 1
# reuse timewait sockets when safe
net.ipv4.tcp_tw_reuse = 1
# turn off fast timewait sockets recycling
net.ipv4.tcp_tw_recycle = 0
# short FIN timeout
net.ipv4.tcp_fin_timeout = 30
# short keepalive time
net.ipv4.tcp_keepalive_time = 1200
# outbound port range
net.ipv4.ip_local_port_range = 10000 65000
# max SYN backlog
net.ipv4.tcp_max_syn_backlog = 4096
# max timewait sockets held by system simultaneously
net.ipv4.tcp_max_tw_buckets = 5000
# TCP receive buffer
net.ipv4.tcp_rmem = 4096 87380 67108864
# TCP write buffer
net.ipv4.tcp_wmem = 4096 65536 67108864
# turn on path MTU discovery
net.ipv4.tcp_mtu_probing = 1

# for high-latency network
net.ipv4.tcp_congestion_control = bbr
# forward ipv4
net.ipv4.ip_forward = 1

# turn on TCP Fast Open on both client and server side
net.ipv4.tcp_fastopen = 3
EOF

sysctl -p /etc/sysctl.d/local.conf

cat <<EOF >> /etc/security/limits.conf
*               soft    nofile          512000
*               hard    nofile          1024000
*               hard    noproc          64000
*               soft    noproc          64000
EOF

# relogin into shell to apply, doesn't need to reboot server.
# To show:
# ulimit -n
