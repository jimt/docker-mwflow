docker-mediawikiflow
====================

##Description
A dockerfile to create an updated Ubuntu 12.04 image with MySQLd and SSHd.

##Usage
./run-mysqld.sh

This creates an **ubuntu** user whose initial password is available in the logs
for the newly started container.

MySQLd uses existing data in /opt/data/mysql if it exists, otherwise it creates
it.


