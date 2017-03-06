#!/usr/bin/env bash

echo "***** Running sublime text 3 *****"

pushd /opt

if [ ! -f /opt/sublime_text/sublime_text ]
then
       
    # Detect the architecture
    if [[ "$(uname -m)" = "x86_64" ]]; then
        ARCHITECTURE="x64"
    else
        ARCHITECTURE="x32"
    fi

    # Fetch the latest build version number (thanks daveol)
    BUILD=$(echo $(curl https://www.sublimetext.com/3) | sed -rn "s#.*The latest build is ([0-9]+)..*#\1#p")

    URL="https://download.sublimetext.com/sublime_text_3_build_{$BUILD}_{$ARCHITECTURE}.tar.bz2"
    INSTALLATION_DIR="/opt/sublime_text"


    # Download the tarball, unpack and install
    curl -o $HOME/st3.tar.bz2 $URL
    if tar -xf $HOME/st3.tar.bz2 --directory=$HOME; then
        mv $HOME/sublime_text_3 $INSTALLATION_DIR
        ln -s $INSTALLATION_DIR/sublime_text /bin/subl
    fi
    rm $HOME/st3.tar.bz2


    # Package Control - The Sublime Text Package Manager: https://packagecontrol.io
    curl -o $HOME/Package\ Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package
    mkdir $INSTALLATION_DIR/Installed\ Packages/
    mv $HOME/Package\ Control.sublime-package $INSTALLATION_DIR/Installed\ Packages/


    # Add to applications list
    ln -s $INSTALLATION_DIR/sublime_text.desktop /usr/share/applications/sublime_text.desktop

    # Set the icon
    sed -i.bak 's/Icon=sublime-text/Icon=\/opt\/sublime_text\/Icon\/128x128\/sublime-text.png/g' /usr/share/applications/sublime_text.desktop

    echo '
    Sublime Text 3 installed successfully!
    Run with: subl
    '
fi

popd

echo "***** Fin! sublime text 3 *****"