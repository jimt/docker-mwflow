FROM jimt/sshd
MAINTAINER Jim Tittsler <jim@oerfoundation.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y

# stock MySQL installation
RUN apt-get install --no-install-recommends -y mysql-server-5.5

# clean up after ourselves
RUN apt-get clean

# make it possible to expose MySQLd outside our container
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

EXPOSE 22
EXPOSE 3306

ADD startup.sh /opt/startup.sh
ENTRYPOINT ["/bin/bash", "/opt/startup.sh"]

