docker-mediawikiflow
====================

##Description
A dockerfile to create an updated Ubuntu 12.04 image with SSHD.

##Usage
docker run -d -p xxxx:22 yyyyyyyyyyyy

This creates an **ubuntu** user whose initial password is available in the logs
for the newly started container.

**NB** These containers are used for development so they update to the latest
Ubuntu packages on creation rather than opting for a predictable, if old,
set of packages.

