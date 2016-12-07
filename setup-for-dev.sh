#!/usr/bin/env bash

echo "***** Running setup-for-dev *****"

user_name=$1

echo "*** Update the repo to ensure we have the latest scripts ***"
git pull

echo "*** Run the development-build/scripts ***"

sh ./scripts/system.sh
sh ./scripts/terminals.sh $user_name
sh ./scripts/basic-packages.sh
sh ./scripts/developer-packages.sh
sh ./scripts/mate.sh
sh ./scripts/fonts.sh
sh ./scripts/developer-languages.sh $user_name

echo "***** Fin! setup-for-dev *****"
