#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

# /etc/init.d/mysql start
service mysql start


# mysql -u root <<EOF
# CREATE DATABASE IF NOT EXISTS $DB_NAME;
# CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';
# GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD' WITH GRANT OPTION;
# GRANT ALL PRIVILEGES ON *.* TO '$DB_ROOT'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
# FLUSH PRIVILEGES;
# UPDATE mysql.user SET Password=PASSWORD('$DB_ROOT_PASSWORD') WHERE User='$DB_ROOT';
# UPDATE mysql.user SET plugin = '' WHERE User = '$DB_ROOT' AND host = 'localhost';
# EOF
mysql --user=root << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'rschleic'@'%' IDENTIFIED BY 'rschleic';
GRANT ALL PRIVILEGES ON wordpress.* TO 'rschleic'@'%' IDENTIFIED BY 'rschleic' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'rschleic';
FLUSH PRIVILEGES;

UPDATE mysql.user SET Password=PASSWORD('rschleic') WHERE User='root';
UPDATE mysql.user SET plugin = '' WHERE User = 'root' AND host = 'localhost';
EOF
# #is the order important/fine?
# #wofuer sind die Update Zeilen
sleep 5
#i suppose for it to get created
# mysqladmin -prschleic shutdown
#for mariadb to not get restarted
# service mysql stop
#should I include this?

exec mysqld_safe