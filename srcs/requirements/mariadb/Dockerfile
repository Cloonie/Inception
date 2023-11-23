# MariaDB Dockerfile

# Takes in a base image from Dockerhub, buster is the development codename for Debian 10.
FROM debian:buster

# Retrives latest package lists and install mariadb-server with option -y to auto-confirm yes.
RUN apt-get update
RUN apt-get install -y \
    mariadb-server \
    mariadb-client

# Removes the package lists that were downloaded during the apt-get update process.
RUN rm -rf /var/lib/apt/lists/*

# Manually make a directory and set permissions.
RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

# Expose the default MariaDB port.
EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

# Start MariaDB on container startup.
CMD ["mysqld", "--bind-address=0.0.0.0"]