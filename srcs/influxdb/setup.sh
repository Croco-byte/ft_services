openrc
mkdir -p /run/openrc
touch /run/openrc/softlevel

sed -i 's/# auth-enabled = false/auth-enabled = true/g' /etc/influxdb.conf
service influxdb start

sleep 3

influx -execute "CREATE USER admin WITH PASSWORD 'adm_influx_pass' WITH ALL PRIVILEGES"
influx -username 'admin' -password 'adm_influx_pass' -execute "CREATE DATABASE grafana"
influx -username 'admin' -password 'adm_influx_pass' -execute "CREATE USER graf_adm WITH PASSWORD 'graf_adm_pass'"
influx -username 'admin' -password 'adm_influx_pass' -execute "GRANT ALL ON grafana TO graf_adm"
# Keep metrics data only for 30 minutes, then reset (for storage concerns)
influx -username 'admin' -password 'adm_influx_pass' -execute "CREATE RETENTION POLICY 'ft_services_30_min' ON 'grafana' DURATION 30m REPLICATION 1 DEFAULT"

telegraf &

tail -F /dev/null
