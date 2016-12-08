#!/usr/bin/env bash

echo "***** Running mongodb *****"
version=2.6.12

cat<<EOF > /etc/yum.repos.d/mongodb.repo
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOF

echo "*** installing mongodb $version ***"
yum install mongodb-org-$version -y

service mongod start

echo "***** Fin! mongodb *****"