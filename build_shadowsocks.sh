#!/bin/bash
set -e

apt-get install python-setuptools
easy_install shadowsocks

echo "Copying shadowsocks.json..."
cp shadowsocks_sample.json /etc/shadowsocks.json
#cp shadowsocks.conf /etc/supervisor/conf.d/shadowsocks.conf

echo -n "Enter your server port:"
read port

iptables -I INPUT -p tcp -m tcp --dport ${port} -j ACCEPT  
if [ $? -ne 0 ];then
	echo "Failed to modify iptables!"
else
	echo "iptables modified!"
	exit 1
fi

ssserver -c /etc/shadowsocks.json -d start
if [ $? -ne 0 ];then
	echo "Shadowsocks service failed to start!"
else
	echo "Shadowsocks service ready to go"
	exit 1
fi

exit 0
