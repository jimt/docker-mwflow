#!/bin/bash

export APACHE_RUN_USER=www-data
export APACHE_RUN_GROUP=www-data
export APACHE_LOG_DIR=${APACHE_LOG_DIR:-/var/log/apache2}

/usr/sbin/a2enmod fastcgi
/usr/sbin/a2enmod rewrite
/usr/sbin/apache2 -D FOREGROUND
