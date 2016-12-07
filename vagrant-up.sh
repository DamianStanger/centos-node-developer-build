#!/usr/bin/env bash

echo "******* Running vagrant-up *******"

user_name=$1

sh ~/Code/development-build/setup-for-dev.sh $user_name
sh ~/Code/development-build/scripts/restart-vm.sh

echo "******* Fin! vagrant-up *******"
