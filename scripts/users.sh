#!/usr/bin/env bash

echo "***** Running users *****"

echo "*** ammending vagrant user password ***"
echo 'vagrant:1234qwer' | chpasswd 

echo "*** adding user cent:cent ***"
sudo useradd cent
sudo echo 1234qwer | passwd cent --stdin
sudo gpasswd -a cent wheel

echo "*** ammending root password ***"
echo 'root:1234qwer' | chpasswd 

echo "***** Fin! users *****"