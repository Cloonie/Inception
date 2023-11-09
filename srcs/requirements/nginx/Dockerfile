FROM nginx:latest

WORKDIR

# Copy the custom NGINX configuration to the container
COPY conf /etc/nginx/conf.d/

# Copy your SSL certificate and key (make sure they are present in the same directory as your Dockerfile)
COPY yourdomain.crt /etc/nginx/ssl/
COPY yourdomain.key /etc/nginx/ssl/

# Expose the HTTPS port (typically 443)
EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]