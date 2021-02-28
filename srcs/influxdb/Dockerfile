FROM alpine

RUN apk update
RUN apk add influxdb telegraf --no-cache
RUN apk add openrc --no-cache

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf 

COPY setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh

CMD 	/root/./setup.sh

EXPOSE 8086
