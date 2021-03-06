#!/bin/ash

ps > liveness.tmp

cat liveness.tmp | grep "grafana-server" > /dev/null 2>&1
ret=$?

cat liveness.tmp | grep "telegraf" > /dev/null 2>&1
ret2=$?

if [ $ret -ne 0 ] || [ $ret2 -ne 0 ]
then
	return 1
else
	return 0
fi
