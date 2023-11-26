FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y \
	wget \
	tar \
	php-mysql \
	php-fpm
	# php \
	# php-cgi \
	# php-pdo \
	# php-gd \
	# php-cli \
	# php-mbstring

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]
