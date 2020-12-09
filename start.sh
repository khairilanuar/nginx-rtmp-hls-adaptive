#!/bin/ash

# generate nginx.conf
chmod 777 /opt/nginx/conf/nginx.conf-adaptive
sed \
-e "s/__AUTH_TOKEN__/$AUTH_TOKEN/g" \
/opt/nginx/conf/nginx.conf-adaptive > /opt/nginx/conf/nginx.conf;

# start nginx
/opt/nginx/sbin/nginx -g 'daemon off;'