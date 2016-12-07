#!/usr/bin/env bash

[ -d ~/Downloads ] || mkdir ~/Downloads

function installGoogleChrome {
    if google-chrome --version &> /dev/null
    then
        echo "Google Chrome already installed"
        return;
    fi

    echo "Installing Google Chrome"
    pushd ~/Downloads
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
    sudo yum install ./google-chrome-stable_current_*.rpm --quiet --assumeyes
    popd

    echo "Google Chrome installed"
}

function installSublimeText3PackageManager {
    if ! subl --version &> /dev/null
    then
        echo "Can't install the package manager as Sublime Text 3 is not yet installed"
        return;
    fi

    if [ -f ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package ]
    then
        echo "Sublime Text 3 package manager already installed"
        return
    fi

    echo "Installing Sublime Text 3 package manager"
    mkdir -p ~/.config/sublime-text-3/Installed\ Packages
    pushd ~/.config/sublime-text-3/Installed\ Packages
    wget -q http://sublime.wbond.net/Package%20Control.sublime-package
    popd

    echo "Sublime Text 3 package manager installed"
}

function installSublimeText3PackageManagerConfig {
    if [[ ! (-f ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package) ]]
    then
        echo "Can't install the Sublime Text 3 package manager config as the package"
        echo "manager is not installed"
        return
    fi

    if [ -f ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings ]
    then
        echo "Sublime Text 3 package manager config already installed"
        return
    fi

    echo Copying SublimeText package settings
    mkdir -p ~/.config/sublime-text-3/Packages/User/
    cp /vagrant/files/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
    cp /vagrant/files/Package\ Control.sublime-settings ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings
    echo "Installed extra packages config"
    echo Finished copying SublimeText package settings
}

function installSublimeText3 {
    if subl --version &> /dev/null
    then
        echo "Sublime Text 3 already installed"
        return;
    fi

    echo "Installing Sublime Text 3"
    pushd ~/Downloads
    wget -q http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3083_x64.tar.bz2
    tar xjf sublime_text_3_build_3083_x64.tar.bz2
    sudo mv sublime_text_3 /opt/
    sudo ln -s /opt/sublime_text_3/sublime_text /usr/bin/subl
    popd

    echo "Sublime Text 3 installed"
}

function installRoboMongo {
    if [ -f /usr/local/bin/robomongo ]
    then
        echo "Assuming that RoboMongo is installed"
        return
    fi

    echo "Installing RoboMongo from source... this will probably take a while."

    # This assumes that the EPEL repo is already installed
    export path="$path:/usr/lib64/qt5/bin"
    sudo yum install qt5-qtbase-devel-5.5.1-2.el7.x86_64 --quiet --assumeyes
    sudo yum install cmake --quiet --assumeyes
    sudo yum install scons --quiet --assumeyes

    git clone https://github.com/paralect/robomongo.git ~/repos/robomongo/
    mkdir ~/repos/robomongo/target
    pushd ~/repos/robomongo/target
    cmake ..
    make
    sudo make install
    popd

    # wget -O ~/Downloads/robomongo-0.8.5-x86_64.rpm http://robomongo.org/files/linux/robomongo-0.8.5-x86_64.rpm
    # rpm -i ~/Downloads/robomongo-0.8.5-x86_64.rpm
    echo "RoboMongo installed"
}

function installBeyondCompare4 {
    if [ -f /usr/bin/bcompare ]
    then
        echo "Assuming that beyond compare 4 is installed"
        return
    fi

    echo "Installing Beyond Compare 4"
    wget -q -O ~/Downloads/bcompare-4.1.2.20720.x86_64.rpm http://www.scootersoftware.com/bcompare-4.1.2.20720.x86_64.rpm
    wget -q -O ~/Downloads/RPM-GPG-KEY-scootersoftware http://www.scootersoftware.com/RPM-GPG-KEY-scootersoftware
    sudo rpm --import ~/Downloads/RPM-GPG-KEY-scootersoftware
    sudo yum localinstall ~/Downloads/bcompare-4.1.2.20720.x86_64.rpm --quiet --assumeyes
    echo "Beyond Compare 4 Installed"
}

function installHipChat {
    if [ -f /opt/HipChat/bin/hipchat ]
    then
        echo "HipChat already installed"
        return
    fi
    echo "Installing HipChat"

    sudo cp /vagrant/files/atlassian-hipchat.repo /etc/yum.repos.d/atlassian-hipchat.repo
    sudo yum install hipchat --quiet --assumeyes

    echo "HipChat installed"
}

function installMongoHacker {
    if [ -f ~/.mongorc.js ] && grep 'http://tylerbrock.github.com/mongo-hacker' ~/.mongorc.js &> /dev/null
    then
        echo "mongo-hacker already installed"
        return
    fi

    echo "Installed mongo-hacker"
    git clone --depth=1 https://github.com/TylerBrock/mongo-hacker.git ~/repos/mongo-hacker
    rm -rf ~/.mongorc.js # may be needed as we don't force the link anymore
    pushd ~/repos/mongo-hacker
    make install
    popd
    echo "Mongo-hacker Installed"
}

# Install Google Chrome (To start use `google-chrome &`)
installGoogleChrome

# Install Sublime Text 3 (To start use `subl`) including package manager
installSublimeText3
installSublimeText3PackageManager
installSublimeText3PackageManagerConfig

# Install HipChat
installHipChat

# Install Mongo Hacker tools
installMongoHacker

# # Install Adobe Source Code Pro Font
# echo ToDo: Install Adobe Source Code Pro Font

# # Install BeyondCompare 4
installBeyondCompare4

# # Install RoboMongo
# installRoboMongo
