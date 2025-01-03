# Use an official Nginx base image
FROM nginx:alpine

# Install PHP and necessary extensions
RUN apk add --no-cache php7 php7-fpm php7-mysqli php7-session php7-mbstring php7-zip php7-opcache php7-curl

# Install TinyFileManager dependencies
RUN apk add --no-cache git

# Set the working directory
WORKDIR /var/www/tinyfilemanager

# Clone the TinyFileManager repository
RUN git clone https://github.com/prasathmani/tinyfilemanager.git /var/www/tinyfilemanager

# Expose the necessary port
EXPOSE 80

# Set the environment variable for the upload directory
ENV MUSIC_DIR=/music

# Link your music directory
VOLUME ["/music"]

# Change permissions to allow upload
RUN chown -R nginx:nginx /var/www/tinyfilemanager && chmod -R 775 /var/www/tinyfilemanager

# Set the entry point to start nginx
CMD ["nginx", "-g", "daemon off;"]
