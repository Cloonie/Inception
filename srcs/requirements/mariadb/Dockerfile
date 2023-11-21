# MariaDB Dockerfile

# Takes in a base image from Dockerhub, bullseye is the development codename for Debian 11.
FROM debian:11

# Retrives latest package lists and install mariadb-server with option -y to auto-confirm yes.
RUN apt-get update
RUN apt-get install mariadb-server -y

# Removes the package lists that were downloaded during the apt-get update process.
RUN rm -rf /var/lib/apt/lists/*

# Manually make a directory and set permissions.
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

# Copy custom MariaDB configuration.
COPY my.cnf /etc/mysql/my.cnf

# Expose the default MariaDB port.
EXPOSE 3306

# Start MariaDB on container startup.
CMD ["mysqld", "--user=mysql", "--console", "--verbose"]