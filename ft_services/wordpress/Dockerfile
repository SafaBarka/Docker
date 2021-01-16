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

RUN apk add wget 

RUN wget https://wordpress.org/latest.tar.gz

RUN tar xf latest.tar.gz

RUN mv wordpress /www/

RUN chown -R www:www /www/wordpress

RUN mv /www/wordpress/wp-config-sample.php /www/wordpress/wp-config.php


COPY srcs/wp-config.php /www/wordpress/

COPY srcs/wordpress.sql /www/wordpress/

RUN rc-update add nginx default

EXPOSE 5050

ENTRYPOINT ["sh","services.sh"]