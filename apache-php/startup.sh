#!/bin/bash

# configure nullmailer so PHP can email
/bin/hostname -f >/etc/nullmailer/me
/bin/hostname -d >/etc/nullmailer/defaultdomain
echo "${MAILHOST:-mail} smtp" >/etc/nullmailer/remotes
mkfifo /var/spool/nullmailer/trigger
chown mail:root /var/spool/nullmailer/trigger
chmod 0622 /var/spool/nullmailer/trigger
su - mail -c "/usr/sbin/nullmailer-send >/var/spool/nullmailer/nullmailer.log 2>&1 & "

export APACHE_RUN_USER=www-data
export APACHE_RUN_GROUP=www-data
export APACHE_LOG_DIR=${APACHE_LOG_DIR:-/var/log/apache2}

/usr/sbin/a2enmod rewrite
/usr/sbin/apache2 -D FOREGROUND
