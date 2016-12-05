#!/bin/sh
rm /run/apache2/httpd.pid
exec /usr/sbin/httpd -D FOREGROUND -f /app/config/httpd.conf
