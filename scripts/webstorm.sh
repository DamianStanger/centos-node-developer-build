#!/usr/bin/env bash

#cd /opt

echo "webstorm > dependencies"
yum install java-1.7.0-openjdk -y
yum install libc.so.6 -y

echo "webstorm > installing"
curl -O -L https://download.jetbrains.com/webstorm/WebStorm-2016.3.1.tar.gz
          #https://download-cf.jetbrains.com/webstorm/WebStorm-2016.3.1.tar.gz
tar xfz WebStorm-2016.3.1.tar.gz
rm WebStorm-2016.3.1.tar.gz

echo "webstorm > creating menu item"
cat<<EOF > /usr/share/applications/webstorm.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Version=1.0
Name=WebStorm
Comment=IDE
Path=/opt/WebStorm-162.1812.21/bin/
Exec=sh webstorm.sh
Icon=/opt/WebStorm-162.1812.21/bin/webstorm.svg
Terminal=false
Categories=Development;
EOF

echo "webstorm > end"
