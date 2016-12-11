#!/usr/bin/env bash

echo "***** Running atom *****"
version=1.12.6

if [ ! -f /usr/bin/atom ]
then

    echo "*** downloading $version"
    curl -O -L https://github.com/atom/atom/releases/download/v$version/atom.x86_64.rpm
    yum localinstall atom.x86_64.rpm -y
    rm atom.x86_64.rpm
fi

echo "***** Fin! atom *****"
