FROM alpine:3.11
#dockerImagePolicy
RUN apk update
# kind: Service
# apiVersion: v1
# metadata:
#   name: nginx-service
# spec:
#   selector:
#     app: nginx
#   ports:
#   - protocol: TCP
#     port: 80
#     targetPort: 80
#     nodePort: 31000
#   type: NodePort

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

RUN apk add  mariadb-client
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add --upgrade telegraf-openrc

RUN apk add telegraf

COPY srcs/telegraf.conf /etc/

EXPOSE 80 443 

ENTRYPOINT ["sh","services.sh"]


#ssh root@192.168.99.103