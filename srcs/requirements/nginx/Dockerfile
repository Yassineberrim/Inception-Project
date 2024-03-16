FROM alpine:3.19

RUN apk update; apk add --no-cache nginx openssl fish

RUN	mkdir -p /etc/nginx/ssl

RUN mkdir /var/www/html

RUN echo Hello > /var/www/html/index.html
RUN	openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/yberrim.42.fr.key -out /etc/nginx/ssl/yberrim.42.fr.crt -sha256 -days 3650 -nodes\
			-subj "/C=MA/ST=Tanger-Tetouan-Al Hoceima/L=Martil/O=1337/OU=1337MED/CN=inception"



COPY	conf/nginx.conf /etc/nginx/http.d/default.conf

# Command to start Nginx
CMD ["nginx", "-g", "daemon off;"]
