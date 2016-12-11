#!/usr/bin/env bash

echo "***** Running sublime text 3 *****"

pushd /opt

if [ ! -f /opt/sublime_text/sublime_text ]
then
    curl -O -L http://git.io/sublimetext
    sh sublimetext
    rm sublimetext
fi

popd

echo "***** Fin! sublime text 3 *****"