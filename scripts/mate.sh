#!/usr/bin/env bash

echo "***** Running mate *****"

echo "*** install -y redhat-lsb-core net-tools epel-release kernel-headers kernel-devel ***"
yum install -y redhat-lsb-core net-tools epel-release kernel-headers kernel-devel

echo "*** install -y 'Development Tools' ***"
yum group install -y "Development Tools"

echo "*** install -y 'X Window System' 'MATE Desktop' ***"
yum group install -y "X Window System" "MATE Desktop"

echo "*** install -y mintmenu ***"
yum install -y mintmenu


systemctl set-default graphical.target

echo "***** Fin! mate *****"
