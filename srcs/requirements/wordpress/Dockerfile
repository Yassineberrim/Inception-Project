FROM debian:bookworm

RUN apt update && apt install -y curl php-fpm php-mysql mariadb-client

COPY conf/wp-config-create.sh /usr/local/bin/install_wordpress
RUN chmod +x /usr/local/bin/install_wordpress

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp

WORKDIR /var/www/html

# Correct the path to the php-fpm socket
RUN sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = \/run\/php\/php8.2-fpm.sock/' /etc/php/8.2/fpm/pool.d/www.conf

# Create directory if it doesn't exist
RUN mkdir -p /var/www/html

# Correct the directory name
ENTRYPOINT ["install_wordpress"]
