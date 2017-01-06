#!/usr/bin/env bash

echo "***** Running mate *****"

echo "*** install -y 'X Window System' 'MATE Desktop' ***"
yum group install -y "X Window System" "MATE Desktop"

echo "*** install -y mintmenu ***"
yum install -y mintmenu


systemctl set-default graphical.target

echo "***** Fin! mate *****"
