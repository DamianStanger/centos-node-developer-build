#!/usr/bin/env bash

echo "***** Running setup-for-dev *****"

user_name=$1

echo "*** Update the development-build repo to ensure we have the latest scripts ***"
cd ~/Code/development-build
git pull

echo "*** Run the development-build/scripts ***"

sh ~/Code/development-build/scripts/system.sh
sh ~/Code/development-build/scripts/terminals.sh $user_name
sh ~/Code/development-build/scripts/basic-packages.sh
sh ~/Code/development-build/scripts/developer-packages.sh
sh ~/Code/development-build/scripts/mate.sh
sh ~/Code/development-build/scripts/fonts.sh
sh ~/Code/development-build/scripts/developer-languages.sh $user_name

echo "***** Fin! setup-for-dev *****"
