#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

service mysql start
echo "hallo" <<EOF
"A"
"B"
"C"
EOF


mysql -u root <<EOF
"USE mysql"
"FLUSH PRIVILEGES"
"SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_ROOT_PASSWORD}')"
"CREATE DATABASE IF NOT EXISTS ${DB_NAME}"
"CREATE USER IF NOT EXISTS '${DB_USER}'@'' IDENTIFIED BY '${DB_USER_PASSWORD}'"
"GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'' IDENTIFIED BY '${DB_USER_PASSWORD}' WITH GRANT OPTION"
"GRANT ALL PRIVILEGES ON *.* TO '${DB_ROOT}'@'%' IDENTIFIED BY '${DB_ROOT_PASSWORD}'"
"UPDATE mysql.user SET Password=PASSWORD('${DB_ROOT_PASSWORD}') WHERE User='${DB_ROOT}'"
"UPDATE mysql.user SET plugin = '' WHERE User='${DB_ROOT}' AND host='localhost'"
"FLUSH PRIVILEGES"
EOF
# #is the order important/fine?
# #wofuer sind die Update Zeilen
#sleep 5
service mysql stop
#should I include this?

exec mysqld_safe