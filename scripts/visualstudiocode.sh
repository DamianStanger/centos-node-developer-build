#!/usr/bin/env bash

echo "***** Running visual studio code *****"

if [ ! -f /usr/share/code/code ]
then
    curl -L https://az764295.vo.msecnd.net/stable/27240e71ef390bf2d66307e677c2a333cebf75af/code-1.9.0-1486023356.el7.x86_64.rpm -o vscode.rpm
    yum localinstall vscode.rpm -y
    rm vscode.rpm
fi

echo "***** Fin! visual studio code *****"