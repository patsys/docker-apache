#!/bin/sh
exec /usr/sbin/httpd -D FOREGROUND -f /app/config/httpd.conf
