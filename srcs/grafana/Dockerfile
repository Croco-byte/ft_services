FROM alpine

RUN apk update
RUN apk add telegraf grafana=7.3.6-r0 --no-cache

COPY grafana.ini /etc/grafana.ini
COPY dashboard.yaml dashboards /usr/share/grafana/conf/provisioning/dashboards/
COPY datasource.yaml /usr/share/grafana/conf/provisioning/datasources/datasource.yaml


RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh

CMD /root/./setup.sh

EXPOSE 3000
