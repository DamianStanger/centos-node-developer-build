#!/usr/bin/env bash

echo "***** Running setup-for-dev *****"

user_name=$1

echo "*** install epel-release and figlet ***"
yum install epel-release -y
yum install figlet -y

echo "*** Update the repo to ensure we have the latest scripts ***"
git pull

figlet "System & windows"

sh ./scripts/system.sh
sh ./scripts/terminals.sh $user_name
sh ./scripts/basic-packages.sh
sh ./scripts/developer-packages.sh
sh ./scripts/mate.sh
sh ./scripts/fonts.sh
sh ./scripts/vboxadditions.sh

figlet "Developer Tooling"

sh ./scripts/developer-languages.sh $user_name
sh ./scripts/developer-tools.sh
sh ./scripts/atom.sh
sh ./scripts/beyondcompare.sh
sh ./scripts/mongo.sh
sh ./scripts/mongodb.sh
sh ./scripts/mongotron.sh
sh ./scripts/robomongo.sh
sh ./scripts/sublimetext3.sh
sh ./scripts/visualstudiocode.sh
sh ./scripts/webstorm.sh

figlet "Web and Coms"

sh ./scripts/googlechrome.sh
sh ./scripts/hipchat.sh
sh ./scripts/slack.sh

echo "***** Fin! setup-for-dev *****"