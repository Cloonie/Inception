#!/bin/bash

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already exists."
else

	echo "USE mysql;
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
	CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
	CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
	GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
	FLUSH PRIVILEGES;
	" > temp.sql;

	mysql_install_db
	mysqld --bootstrap < temp.sql
fi

exec "$@"