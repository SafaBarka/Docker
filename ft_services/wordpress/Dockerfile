FROM alpine:3.11

RUN apk update

RUN apk add nginx

RUN adduser -D -g 'www' www

RUN mkdir /www

RUN chown -R www:www /var/lib/nginx

RUN chown -R www:www /www

COPY srcs/nginx.conf /etc/nginx/

RUN apk add openrc --no-cache

RUN openrc default

RUN rc-update add nginx default

RUN apk add wget 

RUN wget https://wordpress.org/latest.tar.gz

RUN tar xf latest.tar.gz

RUN  mv wordpress/ /www/

RUN chown -R www:www /www/wordpress

RUN  mv /www/wordpress/wp-config-sample.php /www/wordpress/wp-config.php

COPY srcs/wp-config.php /www/wordpress/


RUN apk add php7-fpm php7 php7-session php7-gd php7-opcache   php7-zlib php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

RUN rc-update add php-fpm7 default

RUN apk add php7-mbstring

COPY srcs/index.html  /www

COPY srcs/services.sh /

RUN chmod 777 services.sh 

EXPOSE 5050

ENTRYPOINT ["sh","services.sh"]
