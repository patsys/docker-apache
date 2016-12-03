#!/bin/sh
if [ ! -e /var/web/config/httpd.conf ]; then
  sed -i "s#/etc/apache2/#/var/web/config/#" /etc/apache2/httpd.conf
  sed -i "s#/var/www#/var/web/www#" /etc/apache2/httpd.conf
  sed -i "s# modules/# ../www/modules/#" /etc/apache2/httpd.conf
  mkdir -p /var/web/config/conf.d
  cp /etc/apache2/httpd.conf /var/web/config/ && cp -R /etc/apache2/conf.d/* /var/web/config/conf.d/ && cp /etc/apache2/mime.types /var/web/config/
fi
if [ ! -e /var/web/www/modules ]; then
  mkdir -p /var/web/www/modules
  cp -R /var/www/modules/* /var/web/www/modules/
fi
mkdir -p /var/web/www/logs/
exec /usr/sbin/httpd -D FOREGROUND -f /var/web/config/httpd.conf
