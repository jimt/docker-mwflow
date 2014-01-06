#!/bin/sh
 
docker run -d -p 8023:22 -p 3306:3306 -v /opt/data/mysql:/var/lib/mysql jimt/mysql

