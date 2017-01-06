#!/usr/bin/env bash

echo "***** Running basic-packages *****"

echo '** Installing vim **'
yum install vim -y

echo "*** Install gedit ***"
yum install gedit -y    

echo '** Installing git **'
yum install git -y

echo '** Installing curl **'
yum install curl -y

echo "*** Install archive support ***"
yum install unzip p7zip unrar bzip2 gzip lzma -y
    
echo '** Installing tree **'
yum install tree -y    
    
echo "***** Fin! basic-packages *****"
