FROM alpine:3.11

RUN apk update

RUN apk add mariadb mariadb-common mariadb-client

#RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

RUN apk add openrc --no-cache

RUN openrc default

RUN rc-update add mariadb default

COPY srcs/services.sh /

COPY srcs/mariadb-server.cnf /etc/my.cnf.d/

COPY srcs/create_tables.sql /

COPY srcs/wordpress.sql /

COPY srcs/index.html /www/

#COPY srcs/mysql.sh .

#RUN chmod 777 mysql.sh

#RUN ./mysql.sh

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add --upgrade telegraf-openrc

RUN apk add telegraf

COPY srcs/telegraf.conf /etc/


EXPOSE 3306

ENTRYPOINT ["sh","services.sh"]



