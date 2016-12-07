#!/usr/bin/env bash

echo "***** Running hipchat *****"

cat<<EOF > /etc/yum.repos.d/atlassian-hipchat.repo
[atlassian-hipchat]
name=Atlassian Hipchat
baseurl=http://downloads.hipchat.com/linux/yum
enabled=1
gpgcheck=1
gpgkey=https://www.hipchat.com/keys/hipchat-linux.key
EOF

yum install hipchat -y

echo "***** Fin! hipchat *****"