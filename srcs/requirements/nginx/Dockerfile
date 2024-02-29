FROM alpine:3.16
RUN apk update
RUN apk upgrade 
RUN apk --no-cache nginx
EXPOSE 443
CMD ["nginx", "-g", "deamon off;"]


