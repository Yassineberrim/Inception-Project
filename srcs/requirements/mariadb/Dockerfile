FROM debian:stable
#FROM alpine:3.19.1

# Update package list and install MariaDB server
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

# Create necessary directories
RUN mkdir -p /run/mysqld && \
    mkdir -p /var/lib/mysql

# Configure MariaDB to listen on all interfaces
RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf 
#&& sed -i 's|skip-networking|#skip-networking|g' /etc/mysql/mariadb.cnf

COPY ./conf/create_db.sh /usr/local/bin/create_db.sh

#COPY tools/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chown -R mysql:root /var/run/mysqld

# Make the script executable
RUN chmod +x /usr/local/bin/create_db.sh

# Expose the MariaDB port
EXPOSE 3306

# Run the initialization script
CMD ["sh", "/usr/local/bin/create_db.sh"]