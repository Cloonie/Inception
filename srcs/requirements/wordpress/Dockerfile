FROM debian:buster

RUN apt-get update
RUN apt-get install -y \
	wget \
	tar \
	php-fpm \
	php \
	php-mysql \
	php-cgi \
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
