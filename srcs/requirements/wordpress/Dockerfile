# WordPress Dockerfile

# Takes in a base image from Dockerhub, bookworm is the development codename for Debian 12.
FROM debian:bookworm

# Retrives latest package lists and install wordpress and php-fpm with option -y to auto-confirm yes.
RUN apt-get update
RUN apt-get install wordpress -y
RUN apt-get install php7.4-fpm -y

# Removes the package lists that were downloaded during the apt-get update process.
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 9000