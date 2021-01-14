
rc-service mariadb  start

mariadb -u root -e "CREATE USER  'safa'@'localhost' IDENTIFIED BY '123456';"
mariadb -u root -e "GRANT ALL ON *.* to 'safa'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;"
mariadb -u root -e "FLUSH PRIVILEGES";

