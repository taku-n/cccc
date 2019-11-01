FROM nginx:alpine

RUN apk update \
    && apk --no-cache add certbot

RUN mkdir -p /app/cert

ADD init.sh  /app/cert
ADD renew.sh  /app/cert

WORKDIR /app/cert

EXPOSE 80 443

CMD ["sh", "./init.sh"]
