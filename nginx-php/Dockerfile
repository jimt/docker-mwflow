FROM jimt/ubuntu:12.04
MAINTAINER Jim Tittsler <jim@oerfoundation.org>

# install Nginx and half the PHP universe, plus nullmailer & supervisor
RUN apt-get install -y nginx php5-fpm php-apc php-pear php5-imagick \
 php5-curl php5-gd php5-gmp php5-mysql php5-memcache php5-mcrypt \
 php5-pspell php5-ps php5-tidy php5-imap nullmailer supervisor \
 && apt-get clean

RUN mkdir -p /var/log/supervisor

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN sed -i -e "s/;cgi.fix_pathinfo\s*=\s*1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf

RUN mkdir -p /var/www
RUN /bin/cp /usr/share/nginx/www/index.html /usr/share/nginx/www/50x.html /var/www
ADD php.timezone.ini /etc/php5/fpm/conf.d/php.timezone.ini
ADD pi.php /var/www/pi.php
ADD nginx-default /etc/nginx/sites-available/default

EXPOSE 80

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#ENTRYPOINT "/bin/bash"
ENTRYPOINT "/usr/bin/supervisord"
