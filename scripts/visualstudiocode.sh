#!/usr/bin/env bash

echo "***** Running visual studio code *****"

if [ ! -f /usr/share/code/code ]
then
    curl -L https://az764295.vo.msecnd.net/stable/7ba55c5860b152d999dda59393ca3ebeb1b5c85f/code-1.7.2-1479766213.el7.x86_64.rpm -o vscode.rpm
    yum localinstall vscode.rpm -y
    rm vscode.rpm
fi

echo "***** Fin! visual studio code *****"