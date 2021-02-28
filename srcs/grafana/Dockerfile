FROM alpine

RUN apk update
RUN apk add grafana=7.3.6-r0

COPY grafana.ini /etc/grafana.ini

COPY setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh

CMD /root/./setup.sh
