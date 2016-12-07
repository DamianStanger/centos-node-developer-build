#!/usr/bin/env bash

echo "***** Running developer-packages *****"

echo "*** install -y redhat-lsb-core net-tools epel-release kernel-headers kernel-devel ***"
yum install -y redhat-lsb-core net-tools epel-release kernel-headers kernel-devel

echo "*** install -y 'Development Tools' ***"
yum group install -y "Development Tools"

echo "*** install jq ***"
yum install -y jq  #needed for parsing config.json in users.sh

echo "***** Fin! developer-packages *****"
