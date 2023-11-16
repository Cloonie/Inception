# Use Debian 12 as the base image
FROM debian:12

# Install required packages
RUN apt-get update && \
    apt-get install -y \
        php-fpm \
        php-mysql \
        php-curl \
        php-gd \
        php-mbstring \
        php-xml \
        php-xmlrpc \
        php-zip \
        unzip \
        wget

# Create the /var/www/html directory
RUN mkdir -p /var/www/html

# Download and install WordPress
RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -zxvf /tmp/wordpress.tar.gz -C /var/www/html/ && \
    rm /tmp/wordpress.tar.gz

# Expose port
EXPOSE 9000

# Start PHP-FPM with the built-in web server
CMD ["php", "-S", "0.0.0.0:9000", "-t", "/var/www/html/wordpress"]
