#!/usr/bin/env bash

version=2.6.12

echo "mongodb > setting up repo definition file"
cat<<EOF > /etc/yum.repos.d/mongodb.repo
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOF

echo "mongodb > installing"
yum install mongodb-org-$version -y

echo "mongodb > starting service"
service mongod start

echo "mongodb > end"
