# WordPress Dockerfile
FROM debian:bullseye-slim

# Install necessary packages for WordPress
RUN apt-get update && apt-get install -y \
    wordpress \
    php7.4-fpm \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.4/fpm/php.ini

CMD ["php-fpm7.4", "-F"]
