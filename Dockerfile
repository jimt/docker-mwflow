FROM ubuntu:12.04
MAINTAINER Jim Tittsler <jim@oerfoundation.org>

ENV DEBIAN_FRONTEND noninteractive

# setup our Ubuntu sources (ADD breaks caching)
RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise-updates main\n\
deb http://archive.ubuntu.com/ubuntu/ precise universe\n\
deb http://archive.ubuntu.com/ubuntu/ precise-updates universe\n\
deb http://security.ubuntu.com/ubuntu/ precise-security main\n\
deb http://security.ubuntu.com/ubuntu/ precise-security universe\n" >> /etc/apt/sources.list

# no Upstart or DBus
# https://github.com/dotcloud/docker/issues/1724#issuecomment-26294856
RUN apt-mark hold initscripts udev plymouth mountall
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -s /bin/true /sbin/initctl

RUN apt-get update
RUN apt-get upgrade -y

# install our "base" environment
RUN apt-get install --no-install-recommends -y openssh-server pwgen sudo vim-tiny

# install Apache and half the PHP universe
RUN apt-get install -y apache2-mpm-prefork libapache2-mod-php5 php-apc \
 php5-curl php5-gd php5-gmp php5-mysql php5-memcache

# clean up after ourselves
RUN apt-get clean

EXPOSE 22
EXPOSE 80

ADD startup.sh /opt/startup.sh
ENTRYPOINT ["/bin/bash", "/opt/startup.sh"]

