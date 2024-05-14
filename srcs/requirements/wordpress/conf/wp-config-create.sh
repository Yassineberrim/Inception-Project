#!/bin/bash

if [ ! -f "wp-config.php" ]; then
    mkdir -p /var/www/html/wordpress
    cd /var/www/html/wordpress
    wp core download --allow-root
    wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb --allow-root
    wp core install --url="localhost" --title="Inception" --admin_user=$MARIADB_USER \
    --admin_password=$MARIADB_PASSWORD --admin_email=$MARIADB_EMAIL --skip-email
    wp user create $MARIADB_ADMIN_USER $MARIADB_EMAIL --role=author --user_pass=$MARIADB_ADMIN_PWD --allow-root
fi
    # chmod -R 0777 /var/www/
    chmod -R 0777 /var/www/html/wordpress
    # Ensure www-data user and group exist
    if ! id -u www-data > /dev/null 2>&1; then
        useradd -r -s /usr/sbin/nologin www-data
    fi
    if ! grep -q "^www-data:" /etc/group; then
        groupadd www-data
    fi
    chown -R www-data:www-data /var/www/
    # chmod www-data:www-data /var/www/ /var/www/html/wordpress

/usr/sbin/php-fpm82 -F