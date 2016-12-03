#!/bin/sh
if [ ! -e /app/config/httpd.conf ]; then
  mkdir -p /app/config
  cp /etc/apache2/httpd.conf /app/config/  && cp /etc/apache2/mime.types /app/config/
fi
if [ ! -e /app/config/conf.d ]; then
  mkdir -p /app/config/conf.d
  cp -R /etc/apache2/conf.d/* /app/config/conf.d/
fi
if [ ! -e /app/www ]; then
   mkdir -p /app/www/localhost/htdocs
   cp /tmp/index.php /app/www/localhost/htdocs/
fi
if [ ! -e /app/logs ]; then
   mkdir -p /app/logs
   sed -i "s# logs/# /app/logs/#" /app/config/httpd.conf
fi
sed -i "s# /etc/apache2/# /app/config/#" /app/config/httpd.conf
sed -i "s#/var/www/#/app/www/#" /app/config/httpd.conf
exec /usr/sbin/httpd -D FOREGROUND -f /app/config/httpd.conf
