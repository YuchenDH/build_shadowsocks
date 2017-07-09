#!/bin/bash
set -x

apt-get install python-setuptools
easy_install shadowsocks

cp shadowsocks_sample.json /etc/shadowsocks.json
cp shadowsocks.conf /etc/supervisor/conf.d/shadowsocks.conf

echo -n "Enter your server port:"
read port

iptables -I INPUT -p tcp -m tcp --dport ${port} -j ACCEPT  

ssserver -c /etc/shadowsocks.json -d start

exit 0
