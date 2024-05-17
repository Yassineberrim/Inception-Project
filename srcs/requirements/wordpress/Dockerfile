FROM alpine:3.19.1
#WORKDIR /var/www/html

RUN apk update && apk upgrade && apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-json \
    php-curl \
    php-dom \
    php-exif \
    php-fileinfo \
    php-mbstring \
    php-openssl \
    php-xml \
    php-zip \
    php-tokenizer \
    php-ctype \
    php-phar \
    curl  \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && php wp-cli.phar --info \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp 

RUN sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" \
	/etc/php82/php-fpm.d/www.conf && \
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
	/etc/php82/php-fpm.d/www.conf && \
	sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
	/etc/php82/php-fpm.d/www.conf

RUN mkdir -p /var/www/html \
    && chmod -R 777 /var/www/html 

COPY ./conf/wp-config-create.sh /var/www/html/wp-config-create.sh

RUN chmod +x /var/www/html/wp-config-create.sh

WORKDIR /var/www/html

EXPOSE 9000

CMD ["sh", "wp-config-create.sh"]
