FROM debian:buster

RUN apt-get update && apt-get install -y \
		wget \
		vim \
		php \
		php-fpm \
		php-mysql

COPY ./wordpress.sh ./wordpress.sh

RUN chmod +x ./wordpress.sh

EXPOSE 9000

CMD ["./wordpress.sh"]
