#!/bin/bash

#change the debconf frontend to noninteractive using the environnement variable DEBIAN_FRONTEND
export DEBIAN_FRONTEND="noninteractive"

#insert value(answer to a configuration question) into the debconf database
#pre-seed the debconf database
echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | /usr/bin/debconf-set-selections

# -O is used to write the output of curl to a file
curl -O http://repo.mysql.com/mysql-apt-config_0.8.15-1_all.deb

#dpkg needs wget
apt-get install wget -y

#install a debian software using dpkg command and the option(-i)
dpkg -i mysql-apt-config_0.8.15-1_all.deb

apt-get update

apt-get install -y mysql-server

