#!/bin/bash

if [ -f ./wp-config.php ]; then
	echo "WordPress already installed."
else
	cd /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root

	cp wp-config-sample.php wp-config.php
	sed -i 's/database_name_here/$WP_DATABASE/1' wp-config.php
	sed -i 's/username_here/$MYSQL_USER/1' wp-config.php
	sed -i 's/password_here/$MYSQL_PASSWORD/1' wp-config.php
	sed -i 's/localhost/$WP_LOCALHOST/1' wp-config.php
fi

tail -f /dev/null