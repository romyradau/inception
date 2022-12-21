#!/bin/bash
chown -R mysql:mysql /var/lib/mysql
service mysql start

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
UPDATE mysql.user SET Password=PASSWORD('$DB_ROOT_PASSWORD') WHERE User='$DB_ROOT';
UPDATE mysql.user SET plugin = '' WHERE User = '$DB_ROOT' AND host = 'localhost';
EOF
#TODO:wofuer sind die Update Zeilen

# GRANT ALL PRIVILEGES ON *.* TO '$DB_ROOT'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
#TODO:fragwuerdige Zeile *.* ...???
#TODO:priviliges fuer root @ localhost, weil ja niemand von aussen auf root zugreifen soll.

sleep 5
#i suppose for it to get created
service mysql stop

exec mysqld_safe