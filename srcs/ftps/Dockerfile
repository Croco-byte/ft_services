FROM alpine

RUN apk update
RUN apk add openrc openssl vsftpd --no-cache

RUN { echo "ftps_user_pass"; echo "ftps_user_pass"; } | adduser ftps_user
RUN echo "Hello, I am a file belonging to the ftps_user." > /home/ftps_user/file.txt

RUN mkdir -p /srv/ftp
RUN echo "Hi, this is a file in the root directory of anonymous users." > /srv/ftp/file.txt

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42Paris/CN=qroland" -keyout /etc/ssl/private/ftps.key -out /etc/ssl/certs/ftps.crt

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh


CMD	/root/./setup.sh

EXPOSE 21
EXPOSE 40000
