#!/bin/sh

sudo docker run -d -name mysql -p 127.0.0.1:8023:22 -v /opt/data/mysql:/var/lib/mysql jimt/mysql

