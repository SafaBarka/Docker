rc-service influxdb start
rc-service telegraf start
telegraf --config /etc/telegraf.conf

exec top 