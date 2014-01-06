#!/bin/bash

mkdir /var/run/sshd

# create an ubuntu user
PASS=`pwgen -c -n -1 10`
echo "User: ubuntu Pass: $PASS"
useradd --create-home --shell /bin/bash --user-group --groups adm,sudo ubuntu
echo "ubuntu:$PASS"  | chpasswd

# if we don't have a data directory, create it and root user
if [ ! -f /var/lib/mysql/ibdata1 ]; then
	mysql_install_db

	# start mysql so we can create the root user
	/usr/bin/mysqld_safe &
	sleep 10s

	echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '$PASS' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

	killall mysqld
	sleep 10s
fi

/usr/sbin/sshd
/usr/bin/mysqld_safe 

