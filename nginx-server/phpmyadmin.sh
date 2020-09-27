#!/bin/bash

service mysql start 

# < ? . /usr/share/nginx/html/phpmyadmin/sql/create_tables.sql ?
mysql -u root  < /usr/share/nginx/html/phpmyadmin/sql/create_tables.sql

#-e ?
mysql -u root -e "CREATE USER 'safa'@'localhost' IDENTIFIED BY '123567';"

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'safa'@'localhost' IDENTIFIED BY '123567'";

#mysql -u safa -p123567 -e "CREATE DATABASE db_name";

