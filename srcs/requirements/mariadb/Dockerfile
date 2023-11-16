FROM debian:12

RUN apt-get update -y
RUN apt-get install mariadb-server -y
RUN mysql_secure_installation

# RUN systemctl start mariadb
# RUN systemctl status mariadb
# RUN sed -i 's/bind-address = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

CMD /usr/bin/mysqld_safe