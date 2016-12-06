#!/usr/bin/env bash

echo "******* Running vagrant-up *******"

sh ~/Code/development-build/setup-for-dev.sh
sh ~/Code/development-build/scripts/restart-vm.sh

echo "******* Fin! vagrant-up *******"