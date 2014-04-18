FROM jimt/ubuntu:12.04
MAINTAINER Jim Tittsler <jim@oerfoundation.org>

ENV DEBIAN_FRONTEND noninteractive

# need multiverse
ADD sources.list /etc/apt/sources.list

# install Apache and mod-fastcgi
RUN apt-get update && \
 apt-get install -y apache2-mpm-worker libapache2-mod-fastcgi

# clean up after ourselves
RUN apt-get clean

RUN mkdir -p /var/www

EXPOSE 80

ADD startup.sh /tmp/startup.sh
CMD ["/tmp/startup.sh"]

