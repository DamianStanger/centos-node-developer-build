#!/usr/bin/env bash

echo "***** Running users *****"

user_name = jq '.users.user.name' ../config.json
user_password = jq '.users.user.password' ../config.json
vagrant_name = jq '.users.vagrant.name' ../config.json
vagrant_password = jq '.users.vagrant.password' ../config.json
root_name = jq '.users.root.name' ../config.json
root_password = jq '.users.root.password' ../config.json
echo #{user_name}
echo #{user_password}

echo "*** ammending vagrant user password ***"
echo '{vagrant_name}:#{vagrant_password}' | chpasswd 

echo "*** adding custom user '#{user_name}' ***"
sudo useradd #{user_name}
sudo echo #{user_password} | passwd #{user_name} --stdin
sudo gpasswd -a #{user_name} wheel

echo "*** ammending root password ***"
echo '#{root_name}:#{root_password}' | chpasswd 

echo "***** Fin! users *****"