# syntax=docker/dockerfile:1.3-labs
FROM debian:buster

RUN apt update && apt install -y mariadb-server dumb-init
#automatically created username 
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/script.sh /bin/
RUN chmod +x /bin/script.sh
#one can edit the touch 


ENTRYPOINT [ "/usr/bin/dumb-init" ]

CMD ["/bin/bash", "/bin/script.sh"]

# if you use both, 'ENTRYPOINT' and 'CMD' it is like using
# appending the list in CMD to the ENTRYPOINT command
# e.G.
# ENTRYPOINT [ "/usr/bin/dumb-init" ]
# CMD ["/bin/bash", "/tmp/script.sh"]
# -> /user/bin/dumb-init /bin/bash /tmp/script.sh

# EXAMPLE:
# ENTRYPOINT ["script.sh"]
# CMD ["mysqld_safe"]
# -> script.sh mysqld_safe

#waere im child, wenn der failed, schlecht
#jetzt wird es vermutlich als parent ausgefuehrt und damit bei fail im yml gerestarted
