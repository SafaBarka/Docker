FROM alpine

RUN apk update

RUN apk add mariadb mariadb-common mariadb-client

RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

RUN apk add openrc --no-cache

RUN openrc default

RUN rc-update add mariadb default

COPY srcs/services.sh /

COPY srcs/mariadb-server.cnf /etc/my.cnf.d/

EXPOSE 3306

ENTRYPOINT ["sh","services.sh"]



