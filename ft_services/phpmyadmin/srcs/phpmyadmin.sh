#password = '123456';
#host = 'mysql-service'
#user = 'safa'
#mysql --user=$user --password = $password -h $host < /www/phpmyadmin/sql/create_tables.sql

mysql -u root  -h mysql-service < /www/phpmyadmin/sql/create_tables.sql