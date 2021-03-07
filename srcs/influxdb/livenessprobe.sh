#!/bin/ash

ps > liveness.tmp

cat liveness.tmp | grep "influxd" > /dev/null 2>&1
ret=$?

influx -username 'admin' -password 'adm_influx_pass' -execute "SHOW DATABASES;"
ret2=$?

cat liveness.tmp | grep "telegraf" > /dev/null 2>&1
ret3=$?

if [ $ret -ne 0 ] || [ $ret2 -ne 0 ] || [ $ret3 -ne 0 ]
then
	return 1
else
	return 0
fi
