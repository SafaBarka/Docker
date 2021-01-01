FROM alpine

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

RUN mkdir /etc/nginx/ssl

COPY srcs/localhost.crt /etc/nginx/ssl

RUN apk add openssh

RUN rc-update add sshd

COPY srcs/localhost.key /etc/nginx/ssl

COPY srcs/sshd_config /etc/ssh/

RUN echo "root:root" | chpasswd

COPY srcs/services.sh /


ENTRYPOINT ["sh","services.sh"]


#ssh root@192.168.99.103