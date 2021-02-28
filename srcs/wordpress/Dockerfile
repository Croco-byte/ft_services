FROM alpine

RUN apk update
RUN apk add openssl --no-cache
RUN apk add openrc --no-cache
RUN apk add nginx --no-cache
RUN apk add wget php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session --no-cache

RUN adduser -D -g 'www' www
RUN mkdir -p /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42Paris/CN=qroland" -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt
COPY nginx.conf /etc/nginx/nginx.conf

COPY php_setup.sh /root/php_setup.sh
RUN chmod +x /root/php_setup.sh
RUN /root/php_setup.sh
RUN rm /root/php_setup.sh

RUN wget http://fr.wordpress.org/latest-fr_FR.tar.gz -P /tmp
RUN tar xzf /tmp/latest-fr_FR.tar.gz -C /www/
RUN rm /tmp/latest-fr_FR.tar.gz

COPY wp-config.php /www/wordpress/wp-config.php

EXPOSE 5050

CMD 	php-fpm7 -R; \
	nginx -g "daemon off;"

