#!/usr/bin/env bash

#cd /opt

echo "robomongo > installing"
curl -O -L https://download.robomongo.org/0.9.0-rc10/linux/robomongo-0.9.0-rc10-linux-x86_64-33c89ea.tar.gz
tar xfz robomongo-0.9.0-rc10-linux-x86_64-33c89ea.tar.gz
rm robomongo-0.9.0-rc10-linux-x86_64-33c89ea.tar.gz
mv robomongo-0.9.0-rc10-linux-x86_64-33c89ea/ /opt/robomongo

curl -O -L https://robomongo.org/static/robomongo-64x64-4684f77d.png
mv robomongo-64x64-4684f77d.png /usr/share/icons/robomongo.png
rm robomongo-64x64-4684f77d.png

echo "robomongo > creating menu item"
cat<<EOF > /usr/share/applications/robomongo.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Version=1.0
Name=Robomongo
Comment=IDE
Path=/opt/robomongo/bin/
Exec=/opt/robomongo/bin/robomongo
Icon=/usr/share/icons/robomongo.png
Terminal=false
Categories=Development;
EOF

echo "robomongo > end"
