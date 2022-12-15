# syntax=docker/dockerfile:1.3-labs
FROM debian:buster

RUN apt update
RUN apt install mariadb-server -y
RUN apt install mariadb-client -y
RUN apt install dumb-init
#automatically created username 
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /tmp/
RUN chmod +x /tmp/script.sh
#one can edit the touch 

EXPOSE 3306

ARG DB_NAME
ARG DB_USER
ARG DB_USER_PASSWORD
ARG DB_ROOT
ARG DB_ROOT_PASSWORD

# # RUN service mysql start
# # RUN echo "hallo" <<EOF
# # "A"
# # "B"
# # "C"
# # EOF


# # RUN mysql -u root <<EOF
# # "USE mysql"
# # "FLUSH PRIVILEGES"
# # "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_ROOT_PASSWORD}')"
# # "CREATE DATABASE IF NOT EXISTS ${DB_NAME}"
# # "CREATE USER IF NOT EXISTS '${DB_USER}'@'' IDENTIFIED BY '${DB_USER_PASSWORD}'"
# # "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'' IDENTIFIED BY '${DB_USER_PASSWORD}' WITH GRANT OPTION"
# # "GRANT ALL PRIVILEGES ON *.* TO '${DB_ROOT}'@'%' IDENTIFIED BY '${DB_ROOT_PASSWORD}'"
# # "UPDATE mysql.user SET Password=PASSWORD('${DB_ROOT_PASSWORD}') WHERE User='${DB_ROOT}'"
# # "UPDATE mysql.user SET plugin = '' WHERE User='${DB_ROOT}' AND host='localhost'"
# # "FLUSH PRIVILEGES"
# # EOF
# # #is the order important/fine?
# # #wofuer sind die Update Zeilen
# # #sleep 5
# RUN service mysql stop
# #should I include this?

ENTRYPOINT [ "/usr/bin/dumb-init" ]

CMD ["/bin/bash", "/tmp/script.sh"]
# # mysqld_safe is the recommended way to start a mysqld server on Unix. 
# # mysqld_safe adds some safety features such as restarting the server 
# # when an error occurs and logging runtime information to an error log.

# FROM debian:buster

# RUN apt-get update -y
# RUN apt-get install mariadb-server -y
# COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

# EXPOSE 3306

# ARG DB_NAME
# ARG DB_USER
# ARG DB_USER_PASSWORD
# ARG DB_ROOT_PASSWORD

# RUN service mysql start \
# 	&& mysql -u root -e "USE mysql" \
# 	&& mysql -u root -e "FLUSH PRIVILEGES" \
# 	&& mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_ROOT_PASSWORD}')" \
# 	&& mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}" \
# 	&& mysql -u root -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'' IDENTIFIED BY '${DB_USER_PASSWORD}'" \
# 	&& mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@''"  \
# 	&& mysql -u root -e "FLUSH PRIVILEGES"

# CMD mysqld_safe