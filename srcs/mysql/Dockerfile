FROM alpine

RUN apk update
RUN apk add openrc telegraf --no-cache
RUN apk add mariadb mariadb-client mariadb-common --no-cache

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY setup.sh livenessprobe.sh /root/
COPY wordpress.sql /root/wordpress.sql
RUN chmod +x /root/setup.sh /root/livenessprobe.sh


CMD	/root/./setup.sh
