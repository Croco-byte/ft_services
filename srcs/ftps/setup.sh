#!/bin/sh

openrc &> /dev/null
mkdir -p /run/openrc
touch /run/openrc/softlevel

service vsftpd start

tail -F /dev/null
