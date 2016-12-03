FROM patsys/alpine-mybase
MAINTAINER Patrick Weber <pat.weber91@gmail.com>
COPY index.php /tmp/
COPY apache_setup.sh /etc/my_init.d/
RUN chmod u+x /etc/my_init.d/apache_setup.sh
RUN chmod u+x /etc/update.sh
RUN mkdir /run/apache2/
RUN mkdir /var/web
RUN apk update && apk upgrade && apk add apache2 php5-apache2 && rm -rf /var/cache/apk/*
VOLUME ["/app"]
CMD ["/etc/start"]
