#!/usr/bin/env bash

version=1.0.0-alpha.5

#cd /opt

echo "mongotron > installing"
curl -O -L https://github.com/officert/mongotron/releases/download/$version/Mongotron-linux-x64.zip
unzip Mongotron-linux-x64.zip
rm Mongotron-linux-x64.zip

echo "mongotron > creating menu item"
cat<<EOF > /usr/share/applications/mongotron.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Version=1.0
Name=Mongotron
Comment=IDE
Exec=/opt/Mongotron-linux-x64/Mongotron
Terminal=false
Categories=Development;
EOF

echo "mongotron > end"
