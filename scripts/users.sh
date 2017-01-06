#!/usr/bin/env bash

echo "***** Running users *****"

user_name=$1
user_password=$2
vagrant_name=$3
vagrant_password=$4
root_name=$5
root_password=$6

echo user_name = $user_name
echo vagrant_name = $vagrant_name
echo root_name = $root_name

echo "*** ammending vagrant user password ***"
echo "$vagrant_name:$vagrant_password" | chpasswd 
sudo gpasswd -a $vagrant_name wheel

echo "*** adding custom user '$user_name' ***"
sudo useradd $user_name
sudo echo $user_password | passwd $user_name --stdin
sudo gpasswd -a $user_name wheel

echo "*** ammending root password ***"
echo "$root_name:$root_password" | chpasswd 

echo "*** adding wheel group to sudoers ***"
sed -i 's/# %wheel\tALL=(ALL)\tALL\s*$/%wheel\tALL=(ALL)\tALL/g' /etc/sudoers

echo "***** Fin! users *****"
