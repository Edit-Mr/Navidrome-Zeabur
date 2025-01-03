FROM debian:bullseye

# Install required packages
RUN apt-get update && apt-get install -y \
    nginx \
    navidrome \
    php-cli \
    unzip \
    wget && \
    apt-get clean

# Install Tiny File Manager
RUN mkdir -p /var/www/html && \
    wget -O /var/www/html/index.php https://raw.githubusercontent.com/prasathmani/tinyfilemanager/master/tinyfilemanager.php

# Configure Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Expose volume and ports
VOLUME /files
EXPOSE 80

# Start services
CMD ["bash", "-c", "nginx && navidrome"]
