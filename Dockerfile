FROM alpine:latest
MAINTAINER Patrick Weber <pat.weber91@gmail.com>
COPY update.sh /etc/
COPY start /etc/
COPY apache_setup.sh /etc/my_init.d/
RUN chmod u+x /etc/update.sh
RUN chmod ugo+x /etc/start
RUN mkdir -p /etc/my_init.d
RUN mkdir /run/apache2/
RUN mkdir /var/web
RUN apk update && apk upgrade && apk add apache2 php5-apache2 && rm -rf /var/cache/apk/*
VOLUME ["/var/web"]
CMD ["/etc/start"]
