FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y \
    mariadb-server \
    mariadb-client

RUN rm -rf /var/lib/apt/lists/*

# Allow access to all networks
RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Manually make a directory and set permissions.
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

# Copy shell script and set permissions
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

# Start MariaDB on container startup.
CMD ["mysqld"]