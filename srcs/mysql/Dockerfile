FROM alpine

RUN apk update
RUN apk add openrc --no-cache
RUN apk add mariadb mariadb-client mariadb-common --no-cache

COPY setup.sh /root/setup.sh
COPY wordpress.sql /root/wordpress.sql
RUN chmod +x /root/setup.sh

CMD	/root/./setup.sh
