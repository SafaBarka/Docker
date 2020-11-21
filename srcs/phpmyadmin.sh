#!/bin/bash

service mysql start 

#-----------------------------------------------------------------
#phpmyadmin
#-----------------------------------------------------------------

# < ? . /usr/share/nginx/html/phpmyadmin/sql/create_tables.sql ?
mysql -u root  < /usr/share/nginx/html/phpmyadmin/sql/create_tables.sql

#-e ?
mysql -u root -e "CREATE USER 'safa'@'localhost' IDENTIFIED BY '123567';"

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'safa'@'localhost' IDENTIFIED BY '123567'";

#------------------------------------------------------------------
#wordpress
#------------------------------------------------------------------

#create a basic database configuration which can be used for the Wordpress setup.
mysql -u root -e "CREATE DATABASE wordpress";

mysql -u root -e "GRANT ALL ON wordpress.* TO 'safa'@'localhost' IDENTIFIED BY '123567'"

#import tables (.sql file) to mysql database
mysql -u root wordpress < /usr/share/nginx/html/wordpress.sql

#we need to flush the privileges so that the current instance of mysql knows about the rcent changes we've made.
mysql -u root -e "FLUSH PRIVILEGES";