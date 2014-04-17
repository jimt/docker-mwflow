FROM jimt/ubuntu:12.04
MAINTAINER Jim Tittsler <jim@oerfoundation.org>

ENV DEBIAN_FRONTEND noninteractive

# install Apache and half the PHP universe, plus nullmailer
RUN apt-get update && \
 apt-get install -y apache2-mpm-prefork libapache2-mod-php5 php-apc \
 php5-curl php5-gd php5-gmp php5-mysql php5-memcache php5-mcrypt nullmailer

# clean up after ourselves
RUN apt-get clean

RUN mkdir -p /var/www
ADD pi.php /var/www/pi.php
ADD php.timezone.ini /etc/php5/apache2/conf.d/php.timezone.ini

EXPOSE 80

ADD startup.sh /tmp/startup.sh
CMD ["/tmp/startup.sh"]

