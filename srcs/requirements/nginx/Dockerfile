# Takes in a base image from Dockerhub, bullseye is the development codename for Debian 11.
FROM debian:bullseye

# Retrives latest package lists and install nginx and openssl with option -y to auto-confirm yes.
RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y

# Removes the package lists that were downloaded during the apt-get update process.
RUN rm -rf /var/lib/apt/lists/*

# Create self-signed https certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/nginx.key \
    -out /etc/nginx/nginx.crt \
    -subj "/C=MY/ST=KL/L=Subang/O=42/CN=mliew.42.fr"

# Copy the local nginx.conf into the docker container
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Open the port 443
EXPOSE 443

# CMD instruction specifies the default command to run when a container is started.
CMD ["nginx", "-g", "daemon off;"]
