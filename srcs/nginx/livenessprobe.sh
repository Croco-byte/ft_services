#!/bin/ash

ps > liveness.tmp

cat liveness.tmp | grep "nginx" > /dev/null 2>&1
ret=$?

cat liveness.tmp | grep "telegraf" > /dev/null 2>&1
ret2=$?

cat liveness.tmp | grep "sshd" > /dev/null 2>&1
ret3=$?

if [ $ret -ne 0 ] || [ $ret2 -ne 0 ] || [ $ret3 -ne 0 ]
then
	return 1
else
	return 0
fi
