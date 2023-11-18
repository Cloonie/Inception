# MariaDB Dockerfile
FROM debian:bullseye-slim

# Install MariaDB
RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Copy custom MariaDB configuration if needed
# COPY my.cnf /etc/mysql/my.cnf

CMD ["mysqld", "--innodb-use-native-aio=0"]
