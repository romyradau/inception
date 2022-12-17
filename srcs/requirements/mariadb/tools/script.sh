#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

# /etc/init.d/mysql start
service mysql start


mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
UPDATE mysql.user SET Password=PASSWORD('$DB_ROOT_PASSWORD') WHERE User='$DB_ROOT';
UPDATE mysql.user SET plugin = '' WHERE User = '$DB_ROOT' AND host = 'localhost';
EOF
#TODO:fragwuerdige Zeile *.* ...???

# GRANT ALL PRIVILEGES ON *.* TO '$DB_ROOT'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
#TODO:priviliges fuer root @ localhost, weil ja niemadn von aussen auf root zugreifen soll.
# #wofuer sind die Update Zeilen
sleep 5
#i suppose for it to get created
# mysqladmin -prschleic shutdown
#for mariadb to not get restarted
service mysql stop
#should I include this?

exec mysqld_safe