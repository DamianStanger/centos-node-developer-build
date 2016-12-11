#!/usr/bin/env bash

echo "***** Running vboxadditions *****"
version=5.1.10

pushd /opt

if [ ! -d "/opt/VBoxGuestAdditions-$version" ]
then
    echo "*** downloading version $version ***"
    curl -LO http://download.virtualbox.org/virtualbox/$version/VBoxGuestAdditions_$version.iso
    sudo mkdir /media/VBoxGuestAdditions
    sudo mount -o loop,ro VBoxGuestAdditions_$version.iso /media/VBoxGuestAdditions

    echo "*** installing VBoxGuestAdditions_$version.iso ***"
    sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
    rm VBoxGuestAdditions_$version.iso
    sudo umount /media/VBoxGuestAdditions
    sudo rmdir /media/VBoxGuestAdditions
fi

popd

echo "***** Fin! vboxadditions *****"