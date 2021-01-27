
cd /usr/share/grafana

grafana-server start 

rc-service telegraf start

telegraf --config /etc/telegraf.conf