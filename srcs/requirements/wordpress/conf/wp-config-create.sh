#!bin/sh

#download wordpress files using wp-cli

wp core download --allow-root

#create the wordpress cong file wpconfig.php
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb:3306 --allow-root

#install wordpress with provided url

wp core install --url=$Domain --title=$Title --admin_user=$Admin_user --admin_password=$Admin_password --admin_email=$Admin_email --allow-root

#create a mew wordpress 
wp core install --url=$Domain --title=$Title --admin_user=$Admin_user --admin_password=$Admin_password --admin_email=$Admin_email --allow-root
