#!/usr/bin/env bash

echo "******* Running vagrant-up *******"

user_name=$1

sh ./scripts/mount-datadisk.sh $user_name
sh ./setup-for-dev.sh $user_name
sh ./scripts/restart-vm.sh

echo "******* Fin! vagrant-up *******"
