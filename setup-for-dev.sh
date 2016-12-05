#!/usr/bin/env bash

echo "***** Running setup-for-dev *****"

sh ~/Code/development-build/scripts/system.sh
sh ~/Code/development-build/scripts/users.sh
sh ~/Code/development-build/scripts/basic-packages.sh
sh ~/Code/development-build/scripts/mate.sh
sh ~/Code/development-build/scripts/fonts.sh
sh ~/Code/development-build/scripts/terminals.sh

echo "***** Fin! setup-for-dev *****"
