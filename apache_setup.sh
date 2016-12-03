#!/bin/sh
if [ ! -e /var/web/config/httpd.conf ]; then
  mkdir -p /var/web/config
  cp /etc/apache2/httpd.conf /var/web/config/  && cp /etc/apache2/mime.types /var/web/config/
fi
if [ ! -e /var/web/config/conf.d ]; then
  mkdir -p /var/web/config/conf.d
  cp -R /etc/apache2/conf.d/* /var/web/config/conf.d/
fi
if [ ! -e /var/web/www ]; then
   mkdir -p /var/web/www/localhost/htdocs
   cp /tmp/index.php /var/web/www/localhost/htdocs/
fi
sed -i "s#/etc/apache2/#/var/web/config/#" /var/web/config/httpd.conf
sed -i "s#/var/www#/var/web/www#" /var/web/config/httpd.conf
sed -i "s# modules/# ../../www/modules/#" /var/web/config/httpd.conf
find /var/web/config/conf.d/ -type f -name "*.conf" -print0 | xargs -0 sed -i  "s# modules/# ../../www/modules/#"
mkdir -p /var/web/www/logs/
exec /usr/sbin/httpd -D FOREGROUND -f /var/web/config/httpd.conf
