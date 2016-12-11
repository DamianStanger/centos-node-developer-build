#!/usr/bin/env bash

echo "***** Running robomongo *****"
version="0.9.0-rc10"
pushd /opt

if [ ! -f /opt/robomongo/bin/robomongo ]
then

    echo "*** installing robomongo $version ***"
    curl -O -L https://download.robomongo.org/$version/linux/robomongo-$version-linux-x86_64-33c89ea.tar.gz
    tar xfz robomongo-$version-linux-x86_64-33c89ea.tar.gz
    rm robomongo-$version-linux-x86_64-33c89ea.tar.gz
    mv robomongo-$version-linux-x86_64-33c89ea/ /opt/robomongo

    curl -O -L https://robomongo.org/static/robomongo-64x64-4684f77d.png
    mv robomongo-64x64-4684f77d.png /usr/share/icons/robomongo.png

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

fi

popd

echo "***** Fin! robomongo *****"