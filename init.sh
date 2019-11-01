#!/bin/sh

nginx

if [ $STAGE = production ]; then
  certbot certonly --webroot \
      -n -t --agree-tos -m $EMAIL -w /usr/share/nginx/html -d $DOMAIN
else
  certbot certonly --webroot --test-cert \
      -n -t --agree-tos -m $EMAIL -w /usr/share/nginx/html -d $DOMAIN
fi

envsubst '$DOMAIN' < /etc/nginx/conf.d/cccc.conf.template > /etc/nginx/conf.d/cccc.conf
nginx -s reload

crond -f
