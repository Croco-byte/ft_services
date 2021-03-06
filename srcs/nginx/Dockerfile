FROM alpine

RUN apk update
RUN apk add openrc --no-cache
RUN apk add openssl --no-cache
RUN apk add openssh --no-cache
RUN apk add nginx --no-cache
RUN apk add telegraf --no-cache

RUN ssh-keygen -A
RUN echo "root:sshrootpass" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42Paris/CN=qroland" -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY setup.sh livenessprobe.sh /root/
RUN chmod +x /root/setup.sh /root/livenessprobe.sh

CMD	/root/./setup.sh

EXPOSE 22
EXPOSE 80
EXPOSE 443
