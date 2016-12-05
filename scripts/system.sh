#!/usr/bin/env bash

echo "***** Running system *****"

echo "*** yum update ***"
yum update

echo "*** install deltarpm ***"
yum install -y deltarpm

echo "*** clean all ***"
yum clean all

echo "*** makecache fast ***"
yum makecache fast

echo "*** set timezone ***"
timedatectl set-timezone Europe/London

echo "*** set keymaps ***"
localectl set-keymap gb
localectl set-x11-keymap gb

echo "***** Fin! system *****"
