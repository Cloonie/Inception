FROM debian:bookworm

RUN apt-get update
RUN apt-get install nginx -y
    # apt-get install openssl \
    # openssl req -new -newkey rsa:2048 -nodes -keyout web-service.key -out web-service.csr

COPY ./nginx.conf /etc/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
