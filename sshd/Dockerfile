FROM ubuntu:16.04
MAINTAINER Jim Tittsler <jimt@onjapan.net>

ENV DEBIAN_FRONTEND noninteractive

# setup our Ubuntu sources (ADD breaks caching)
RUN echo "deb http://archive.ubuntu.com/ubuntu/ vivid-updates main\n\
deb http://archive.ubuntu.com/ubuntu/ vivid universe\n\
deb http://archive.ubuntu.com/ubuntu/ vivid-updates universe\n\
deb http://security.ubuntu.com/ubuntu/ vivid-security main\n\
deb http://security.ubuntu.com/ubuntu/ vivid-security universe\n" >> /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y

# install our "base" environment
RUN apt-get install --no-install-recommends -y openssh-server pwgen sudo vim-tiny

# clean up after ourselves
RUN apt-get clean

EXPOSE 22

ADD startup.sh /opt/startup.sh
ENTRYPOINT ["/bin/bash", "/opt/startup.sh"]

