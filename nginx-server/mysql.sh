#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"

echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | /usr/bin/debconf-set-selections

curl -O http://repo.mysql.com/mysql-apt-config_0.8.15-1_all.deb

apt-get install wget -y

dpkg -i mysql-apt-config_0.8.15-1_all.deb

apt-get update

apt-get install -y mysql-server

