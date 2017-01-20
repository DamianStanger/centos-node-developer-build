#!/usr/bin/env bash

echo "***** Running gitkraken *****"
pushd /opt

if [ ! -f /usr/share/applications/gitkraken.desktop ]
then 
    echo "*** installing gitkraken ***"
    curl -O -L https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz

    tar xfz gitkraken-amd64.tar.gz
    rm gitkraken-amd64.tar.gz

cat<<EOF > /usr/share/applications/gitkraken.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Version=1.0
Name=gitkraken
Comment=IDE
Path=/opt/gitkraken/
Exec=/bin/gitkraken
Icon=/usr/share/icons/mate/scalable/mimetypes/application-x-executable-symbolic.svg
Terminal=false
Categories=Development;
EOF

fi

ln -sf /opt/gitkraken/gitkraken /usr/bin/gitkraken

popd

echo "***** Fin! webstorm *****"