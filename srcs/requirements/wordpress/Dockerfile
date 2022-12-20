FROM debian:buster

RUN apt update && apt install -y \
    mariadb-client \
	php \
	php-fpm \
	#entweder manuell angeben welche version oder default TODO:what's the www.config path ?	
	curl \
	&& rm -rf /var/lib/apt/lists/*
	#uses known stuff when rebuilding, making it less cluttered

	#maybe put teh amriadb client here??

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar bin/wp
	#makes wp usable as command otherwise it would be wp-cli...
COPY tools/www.conf etc/php-fpm.d/pool.d
#php variablen pool www.conf
#The pool config determines amongst other things how php-fpm listens for connections
#(e.g. via Unix socket or via TCP IP:port)

COPY ./tools/script.sh /var/www/html/config.sh
RUN chmod +x /var/www/html/config.sh
ENTRYPOINT [ "/var/www/html/config.sh" ]
#mit entrypoint lauft das script als pid 1
#TODO:wie ist php-fpm jetzt hier verlinkt?
#TODO: exec php-fpm im script selbst!