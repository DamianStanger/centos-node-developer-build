#!/usr/bin/env bash

echo "***** Running developer-packages *****"

echo "*** install -y redhat-lsb-core net-tools kernel-headers kernel-devel ***"
yum install -y redhat-lsb-core net-tools kernel-headers kernel-devel

echo "*** install -y 'Development Tools' ***"
yum group install -y "Development Tools"

echo "*** install jq ***"
yum install -y jq

echo "***** Fin! developer-packages *****"
