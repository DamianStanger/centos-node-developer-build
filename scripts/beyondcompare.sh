#!/usr/bin/env bash

echo "***** Running beyond compare *****"
version=4.1.9.21719

if [ ! -f /usr/share/applications/bcompare.desktop ]
then
    echo "*** downloading $version"
    curl -O -L http://www.scootersoftware.com/bcompare-$version.x86_64.rpm
    curl -O -L http://www.scootersoftware.com/RPM-GPG-KEY-scootersoftware
    rpm --import RPM-GPG-KEY-scootersoftware

    echo "*** installing"
    yum localinstall bcompare-$version.x86_64.rpm -y

    echo "*** cleanup"
    rm bcompare-$version.x86_64.rpm
    rm RPM-GPG-KEY-scootersoftware
fi

echo "***** Fin! beyond compare *****"