#!/bin/sh

certbot certonly --standalone -t -d your.domain -m your@email.address --agree-tos -n
nginx
crond -f
