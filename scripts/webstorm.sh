#!/usr/bin/env bash

echo "***** Running webstorm *****"
version="WebStorm-2016.3.1"
#cd /opt

#echo "*** installing java 1.7 and libc"
#yum install java-1.7.0-openjdk -y
#yum install libc.so.6 -y

echo "*** installing webstorm $version ***"
curl -O -L https://download.jetbrains.com/webstorm/$version.tar.gz
          #https://download-cf.jetbrains.com/webstorm/$version.tar.gz
tar xfz $version.tar.gz -C /opt/$version
rm $version.tar.gz

cat<<EOF > /usr/share/applications/webstorm.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Version=1.0
Name=WebStorm
Comment=IDE
Path=/opt/$version/bin/
Exec=sh webstorm.sh
Icon=/opt/$version/bin/webstorm.svg
Terminal=false
Categories=Development;
EOF

echo "***** Fin! webstorm *****"