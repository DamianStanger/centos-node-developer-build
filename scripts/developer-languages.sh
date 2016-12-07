#!/usr/bin/env bash

echo "***** Running developer-languages *****"

user_name=$1

function installRuby {
    echo "*** Install Ruby ***"
    if ruby --version &> /dev/null
    then
        echo Ruby already installed
        return;
    fi
    # Install RVM (Ruby the right way)
    # gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 || \
    #     curl -sSL https://rvm.io/mpapis.asc | gpg --import -

    # \curl -sSL https://get.rvm.io | bash -s stable

    # Install RUBY (Ruby the old fashioned way)
    ruby --version &> /dev/null || ( \
        sudo yum install ruby --quiet --assumeyes && \
        sudo yum install gcc gcc-c++ make automake autoconf curl-devel openssl-devel --quiet --assumeyes && \
        sudo yum install zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel --quiet --assumeyes && \

        sudo yum install ruby-rdoc ruby-devel --quiet --assumeyes
        )
}

function installCompass {
    echo "*** Install Compass ***"
    if compass --version &> /dev/null
    then
        echo Compass already installed
        return;
    fi

    # Try to install from gem but if it doesn't work then build from source
    sudo gem install compass || \
        (gem sources -r https://rubygems.org/ && sudo gem install compass) || \
        (gem sources -a http://rubygems.org/  && sudo gem install compass)
}

function installScssLint {
    echo "*** Install ScssLint ***"
    if scss-lint --version &> /dev/null
    then
        echo Compass already installed
        return;
    fi

    scss-lint --version &> /dev/null || sudo gem install scss_lint
}

function installNode {
    nvm_version=0.32.1
    node_version=4.4.7

    echo "*** Install nvm $nvm_version and node $node_version for user $user_name ***"

    su - $user_name -c "curl -O -L https://raw.githubusercontent.com/creationix/nvm/v$nvm_version/install.sh"
#    su - $user_name -c "sh install.sh"
#    su - $user_name -c "rm install.sh"
#    su - $user_name -c "source ~/.bashrc"
#    su - $user_name -c "source ~/.zshrc"

    echo "*** Install node $node_version ***"
     su - $user_name -c "sh install.sh;rm install.sh;source ~/.zshrc;nvm install $node_version;nvm use $node_version"
#    su - $user_name -c "nvm install $node_version"
#    su - $user_name -c "nvm use $node_version"

    echo "*** configure node ***"
    su - $user_name -c "cat<<EOF > ~/.npmrc
    registry=http://sinopia.pra.rbxd.ds/
    always-auth=true
    email=test@test.org
    username=installonly
    _auth=\"aW5zdGFsbG9ubHk6ZGV2NTY=\"
    EOF"
}

installNode
installRuby
installCompass
installScssLint


echo "***** Fin! developer-languages *****"
