#!/usr/bin/env bash

echo "***** Running postman *****"
pushd /opt

if [ ! -f /usr/share/applications/postman.desktop ]
then 
    echo "*** installing postman ***"
    curl https://dl.pstmn.io/download/latest/linux64 -l -o postman.tar.gz

    tar xfz postman.tar.gz
    rm postman.tar.gz    

cat<<EOF > /usr/share/applications/postman.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Version=1.0
Name=postman
Comment=IDE
Path=/opt/Postman/
Exec=/bin/postman
Icon=/opt/Postman/resources/app/icon.png
Terminal=false
Categories=Development;
EOF

fi

ln -sf /opt/Postman/Postman /usr/bin/postman

popd

echo "***** Fin! postman *****"