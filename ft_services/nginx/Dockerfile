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


RUN echo "daemon off;" >> /etc/nginx/nginx.conf


RUN mkdir /etc/nginx/ssl

COPY srcs/localhost.crt /etc/nginx/ssl

#https://wiki.alpinelinux.org/wiki/Setting_up_a_ssh-server

RUN apk add openssh

RUN rc-update add sshd

#RUN rc-service sshd  start

COPY srcs/localhost.key /etc/nginx/ssl

#VOLUME [ “/sys/fs/cgroup” ]
#/etc/init.d/sshd start
CMD  rc-service sshd start &&  rc-service nginx start 

#VOLUME [ “/sys/fs/cgroup” ]
#WORKDIR /usr/data
#RUN rc-service nginx start 
#CMD ["nginx", "-g", "daemon off;"]


#ssh root@192.168.99.103