FROM alpine:3.11

#RUN wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz

#RUN tar -zxvf grafana-7.3.7.linux-amd64.tar.gz

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update 

RUN apk add grafana

#RUN mv grafana-7.3.7 grafana

COPY srcs/services.sh /

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update


RUN apk add --upgrade telegraf-openrc

RUN apk add telegraf

COPY srcs/telegraf.conf /etc/

COPY srcs/grafana.db /usr/share/grafana/data/

EXPOSE 3000

ENTRYPOINT ["sh","services.sh"]
