
rc-service mariadb  start

mariadb -u root -e "CREATE USER  'safa'@'localhost' IDENTIFIED BY '123456';"
mariadb -u root -e "GRANT ALL ON *.* to 'safa'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;"
mysql -u root < create_tables.sql
mysql -u root -e "CREATE DATABASE wordpress";
mariadb -u root -e "FLUSH PRIVILEGES";

