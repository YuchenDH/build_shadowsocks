#!/bin/bash
set -x

sudo easy_install shadowsocks

cd /etc/
sudo wget "Your shadowsocks.json here"

ssserver -c /etc/shadowsocks.json -d

