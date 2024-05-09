#!bin/sh

cd /var/www/html/wordpress
if [ ! -f "wp-config.php" ]; then

#Downloading and extracting Wordpress core files to the current directory
    wp core download --allow-root
    wp core config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root
    wp core install --url=${DOMAIN_NAME} --title=DopamInception --admin_user="Admin" --admin_password="1337" --admin_email="yberrim@inception.com" --a
    # Creating the wp-config.php file using this command.
    # Installing wordpress using the given environment variables to avoid showing the wordpress installation page everytime we run the containe
fi    
exec $@