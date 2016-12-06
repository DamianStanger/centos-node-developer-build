#!/usr/bin/env bash

echo "***** Running setup-for-dev *****"

echo "*** Update the development-build repo to ensure we have the latest scripts ***"
cd ~/Code/development-build
git pull

echo "*** Run the development-build/scripts ***"

sh ~/Code/development-build/scripts/system.sh
sh ~/Code/development-build/scripts/basic-packages.sh
sh ~/Code/development-build/scripts/developer-packages.sh  #must be before users.sh
sh ~/Code/development-build/scripts/users.sh
sh ~/Code/development-build/scripts/mate.sh
sh ~/Code/development-build/scripts/fonts.sh
sh ~/Code/development-build/scripts/terminals.sh

echo "***** Fin! setup-for-dev *****"