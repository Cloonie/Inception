FROM debian:buster

RUN apt-get update
RUN apt-get install -y \
    mariadb-server \
    mariadb-client

RUN rm -rf /var/lib/apt/lists/*

# Manually make a directory and set permissions.
RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

# Copy shell script and set permissions
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

# Start MariaDB on container startup.
CMD ["mysqld", "--bind-address=0.0.0.0"]