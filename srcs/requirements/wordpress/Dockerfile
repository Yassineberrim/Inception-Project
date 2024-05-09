FROM alpine:3.19.1

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
    curl 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp-config-create.sh /wp-config-create.sh

RUN chmod +x wp-config-create.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/wp-config-create.sh" ]

CMD [ "php-fpm", "-R", "-F" ]
