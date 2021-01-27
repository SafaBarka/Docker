rc-service  php-fpm7   start
rc-service nginx start 

rc-service telegraf start

telegraf --config /etc/telegraf.conf
exec top 
