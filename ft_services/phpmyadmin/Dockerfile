FROM alpine:3.11

RUN apk update

RUN apk add nginx

RUN adduser -D -g 'www' www

RUN mkdir /www

RUN chown -R www:www /var/lib/nginx

RUN chown -R www:www /www

COPY srcs/nginx.conf /etc/nginx/

COPY srcs/index.html /www/

RUN apk add openrc --no-cache

RUN openrc default

RUN rc-update add nginx default

RUN  apk add wget 

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz

RUN tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz

RUN mv phpMyAdmin-5.0.2-all-languages/ phpmyadmin/

RUN mv phpmyadmin/ /www/

RUN mkdir www/phpmyadmin/temp/

RUN chmod 777 /www/phpmyadmin/temp/

RUN chown -R www:www /www/phpmyadmin

RUN mv /www/phpmyadmin/config.sample.inc.php  /www/phpmyadmin/config.inc.php

COPY srcs/config.inc.php /www/phpmyadmin/

RUN apk add php7-fpm php7 php7-session php7-gd php7-opcache   php7-zlib php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

RUN rc-update add php-fpm7 default
RUN apk add php7-mbstring
RUN apk add  mariadb-client
COPY srcs/phpmyadmin.sh /

#RUN chmod 777 phpmyadmin.sh

#RUN ./phpmyadmin.sh
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add --upgrade telegraf-openrc

RUN apk add telegraf
COPY srcs/telegraf.conf /etc/

EXPOSE 5000 

COPY srcs/services.sh /

ENTRYPOINT ["sh","services.sh"]


#ssh root@192.168.99.103