FROM debian:buster

RUN apt update && apt install -y \
	php \
	php-fpm \
	curl \
	rm -rf /var/lib/apt/lists/*
	#cache wird geloescht

#entweder manuell angeben welche version oder default	

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	chmod +x wp-cli.phar \
	sudo mv wp-cli.phar /usr/local/bin/wp \
	sudo wp cli update

# RUN docker-php-ext-install mysqli
#this will install mysql extension for php
RUN mkdir -p /var/www/html \
	&& wp core download --path=/var/www/html

COPY ./tools/wp-config.php /var/www/html/wordpress/


#script
	#cd new_wp \
	#TODO:muss ich hier cd in meine volume machen??? er hat mkdir gemacht als er in var/www/html war
	#TODO:alles findet ja im Ordner der Volume statt, oder ist das automatisch verlinkt?
	# wp core download \
	wp core config --dbname=${DB_NAME} --dbuser=${DB_ROOT} --dbpass=${DB_ROOT_PASSWORD} --dbhost=localhost \
	#TODO:--dbprefix=...??? braucht man das?
	#this one is for generating the wp config
	#TODO:aber das hab ich ja theoretisch... sollte ich nicht mein locales wp-config.php nach /var/www/html/wp-config.php kopieren??

# RUN rm /var/www/html/wp-config.php
# COPY ./tools/wp-config.php /var/www/html/wp-config.php
	#TODO:muss ich die bestehenden Files nicht erstmal rausloeschen... wobei ist nicht alles leer wenn ich ganz neu wp installiere??
	wp db create \
	wp core install --url=http://example.com --title=MySite --admin_user=${DB_USER} --admin_password=${DB_USER_PASSWORD} --admin_email=rschleic@student.42heilbronn.de
	#TODO:wer ist hier admin und wer ist db_user, bzw ist db_user der root???
#fresh wordpress installation + cerate admin user account
#USER
#TODO:do i have to add another admin - dann haette ich ja root und admin?!
#wp user create <name> <mail> --role=<role> --first_name+<name> --last_name=<lastname> --user_pass=<password>

#TODO:wie ist php-fpm jetzt hier verlinkt?
#TODO: exec php-fpm
#search for necessary options for php fpm - run im Vordergrund
#mit entrypoint lauft das script als pid 1