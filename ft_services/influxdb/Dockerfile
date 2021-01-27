FROM alpine:3.11

RUN apk update

RUN apk add --upgrade influxdb

RUN apk add openrc --no-cache

RUN openrc default

RUN rc-update add influxdb default

COPY srcs/services.sh /

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add --upgrade telegraf-openrc

RUN apk add telegraf

COPY srcs/telegraf.conf /etc/



EXPOSE 8086

ENTRYPOINT ["sh","services.sh"]