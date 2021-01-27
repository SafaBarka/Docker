rc-service sshd  start
rc-service nginx start 

rc-service telegraf start

telegraf --config /etc/telegraf.conf
exec top 