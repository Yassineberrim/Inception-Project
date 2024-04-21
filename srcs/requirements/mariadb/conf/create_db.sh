#!/bin/bash

# Cette ligne vérifie si le répertoire /run/mysqld existe
# en utilisant l'opérateur de test -d.
if [ ! -d "/run/mysqld" ]; then
    mkdir /run/mysqld;
fi

cat << EOF > /tmp/wp.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
EOF

# Install mariadb-client package
# Uncomment the following line if the package is not installed
# sudo apt-get install mariadb-client

mariadbd --user=root --bootstrap < /tmp/wp.sql;

# Supprimer le fichier SQL après utilisation
rm -f /tmp/wp.sql;

# Exécuter les commandes supplémentaires passées en argument
exec "$@"
