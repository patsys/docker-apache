#!/bin/sh
if [ -e /run/apache2/httpd.pid ]; then 
  rm /run/apache2/httpd.pid
fi
exec /usr/sbin/httpd -D FOREGROUND -f /app/config/httpd.conf
