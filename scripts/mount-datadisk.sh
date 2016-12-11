#!/usr/bin/env bash

echo "***** Running mount datadisk *****"

if [ ! -b /dev/sdb1 ]
then
    echo "*** creating partition ***"
    echo -e "n\np\n1\n\n\nw" | sudo fdisk /dev/sdb

    echo "*** formatting sdb1 as ext3 ***"
    mkfs.ext3 /dev/sdb1 #only if it is not already formatted! 
fi

if ! mount -l | grep sdb1 
then
    echo "*** mounting new drive as /stuff ***"
    mkdir /stuff 
    mount /dev/sdb1 /stuff
    echo "/dev/sdb1  /stuff  ext3  defaults  0  0" >> /etc/fstab
    mkdir /stuff/Code
    mkdir /stuff/Data
    chmod 777 -R /stuff
fi

echo "***** Fin! mount datadisk *****"