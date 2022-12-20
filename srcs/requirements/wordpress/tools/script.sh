#!/bin/bash

# cd /var/www/html
wp core download --path=/var/www/html
#Downloads and extracts WordPress core files to the specified path.
	#cd new_wp \
	#TODO:muss ich hier cd in meine volume machen??? er hat mkdir gemacht als er in var/www/html war
	#TODO:alles findet ja im Ordner der Volume statt, oder ist das automatisch verlinkt?
	# wp core download \
# wp core config --dbname=${DB_NAME} --dbuser=${DB_ROOT} --dbpass=${DB_ROOT_PASSWORD} --dbhost=localhost \
wp core config --path=/var/www/html --dbname=${DB_NAME} --dbuser=${DB_ROOT} --dbpass=${DB_ROOT_PASSWORD} --dbhost=${HOST_NAME} \

	#TODO:--dbprefix=...??? braucht man das?
	#this one is for generating the wp config
	#TODO:aber das hab ich ja theoretisch... sollte ich nicht mein locales wp-config.php nach /var/www/html/wp-config.php kopieren??

# RUN rm /var/www/html/wp-config.php
# COPY ./tools/wp-config.php /var/www/html/wp-config.php
	#TODO:muss ich die bestehenden Files nicht erstmal rausloeschen... wobei ist nicht alles leer wenn ich ganz neu wp installiere??

wp core install --path=/var/www/html --url=${WP_ADMIN_URL} --title=${WP_TITLE} --admin_user=${DB_USER} --admin_password=${DB_USER_PASSWORD} --admin_email=rschleic@student.42heilbronn.de
	#TODO:wer ist hier admin und wer ist db_user, bzw ist db_user der root???
#fresh wordpress installation + cerate admin user account
#USER
#TODO:do i have to add another admin - dann haette ich ja root und admin?!
wp user create --path=/var/www/html ${WP_USER} ${WP_USER_MAIL} --role=editor --first_name=roxx --last_name=slr --user_pass=${WP_USER_PASSWORRD}
#The role of the user to create. Default: default role. Possible values include ‘administrator’, ‘editor’, ‘author’, ‘contributor’, ‘subscriber’.
php-fpm -F
#TODO:why does one has to enable that manually??