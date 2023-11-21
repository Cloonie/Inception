# WordPress Dockerfile

# Takes in a base image from Dockerhub, bullseye is the development codename for Debian 11.
# FROM debian:buster

# # # Retrives latest package lists and install wordpress and php-fpm with option -y to auto-confirm yes.
# RUN apt-get update

# Use debian:10 as the base image
FROM debian:10

# Update package list and install required packages
RUN apt-get update
RUN apt-get install -y \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
    curl

# Removes the package lists that were downloaded during the apt-get update process.
RUN rm -rf /var/lib/apt/lists/*

RUN php-fpm -v

RUN mkdir -p /var/www/html \
    && chown -R root:root /var/www/html

# Download and install WordPress
RUN curl -O https://wordpress.org/latest.tar.gz \
    && tar -zxvf latest.tar.gz -C /var/www/html \
    && rm latest.tar.gz

# Expose the port used by PHP-FPM
EXPOSE 9000

# Start PHP-FPM on container startup
CMD ["/usr/sbin/php-fpm", "--nodaemonize"]
