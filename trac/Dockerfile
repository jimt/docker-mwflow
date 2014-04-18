FROM jimt/apache-fcgi
MAINTAINER Jim Tittsler <jim@oerfoundation.org>

ENV DEBIAN_FRONTEND noninteractive

# need multiverse
ADD sources.list /etc/apt/sources.list

# install Trac
RUN apt-get update && \
 apt-get install -y python-mysqldb \
   trac trac-accountmanager trac-git trac-spamfilter

# clean up after ourselves
RUN apt-get clean

RUN mkdir -p /var/www

EXPOSE 80

ADD startup.sh /tmp/startup.sh
CMD ["/tmp/startup.sh"]

