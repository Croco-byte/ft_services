# The script to setup mariadb below is an rc script. We need to start the openrc daemon, and take care of a bug by creating a file "softlevel" in /run/openrc/
openrc &> /dev/null
mkdir -p /run/openrc
touch /run/openrc/softlevel

/usr/bin/telegraf &

# Setup the mariadb database by creating system tables and such through the rc script "setup"
/etc/init.d/mariadb setup &> /dev/null

# Next, we need to enable networking, so that we can reach the database from the local network, outside of the containder hosting the database
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

# Everything is setup fine, we restart the mariadb service
service mariadb restart &> /dev/null

# After the setup, two all-privilege accounts were created : root and mysql. But you need to be system user root / system user mysql to access these accounts. We will create two other accounts : one with all the rights on the wordpress database, and one with all the rights on all databases. These will be remote users, able to connect from anywhere on the network

mysql -u root --skip-password -e "CREATE DATABASE wordpress;"

if [ $? -eq 0 ]; then
	mysql -u root --skip-password wordpress < /root/wordpress.sql
fi
	mysql -u root --skip-password -e "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_database_user'";
	mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%' WITH GRANT OPTION;"
	mysql -u root --skip-password -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'adm_database_user'";
	mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;"
	mysql -u root --skip-password -e "FLUSH PRIVILEGES;"


# Infinite loop to keep container active
tail -F /dev/null
