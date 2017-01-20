#!/usr/bin/env bash

echo "***** Running webstorm *****"
version="WebStorm-2016.3.1"
pushd /opt

if [ ! -f /usr/share/applications/webstorm.desktop ]
then 
    echo "*** installing webstorm $version ***"
    curl -O -L https://download.jetbrains.com/webstorm/$version.tar.gz

    tar xfz $version.tar.gz
    rm $version.tar.gz
    mv WebStorm-* $version

cat<<EOF > /usr/share/applications/webstorm.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Version=1.0
Name=WebStorm
Comment=IDE
Path=/opt/$version/bin/
Exec=/bin/webstorm
Icon=/opt/$version/bin/webstorm.svg
Terminal=false
Categories=Development;
EOF

fi

ln -sf /opt/$version/bin/webstorm.sh /usr/bin/webstorm

popd

echo "***** Fin! webstorm *****"