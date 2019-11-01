#!/bin/sh

nginx

#                                                                         #
# Change foo.bar to your domain. Change your@email.address to your email. #
#                                                                         #

# for staging
certbot certonly --webroot --test-cert -n -t --agree-tos -m your@email.address -w /usr/share/nginx/html -d your.domain

# for production
#certbot certonly --webroot -n -t --agree-tos -m your@email.address -w /usr/share/nginx/html -d your.domain

sed -e 's!#include /etc/nginx/conf\.d/\*\.conf;!include /etc/nginx/conf\.d/\*\.conf;!g' /etc/nginx/nginx.conf > /etc/nginx/nginx.conf.tmp
cat /etc/nginx/nginx.conf.tmp > /etc/nginx/nginx.conf
rm /etc/nginx/nginx.conf.tmp
nginx -s reload

crond -f
