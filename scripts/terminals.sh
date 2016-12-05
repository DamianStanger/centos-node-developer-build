#!/usr/bin/env bash

echo "***** Running terminals *****"

function installZsh {

    echo '*** Installing ZSH ***'
    sudo yum install -y zsh
    sudo chsh -s /bin/zsh vagrant
    sudo chsh -s /bin/zsh cent
    sudo chsh -s /bin/zsh root
    # [ -f ~/.bashrc ] || rm ~/.bashrc

    echo "*** Install OhMyZsh ***"
    [ -d ~/.oh-my-zsh/ ] || \
        ( sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" )

    echo "*** Change the OhMyZsh theme ***"
    sed -i -- 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' .zshrc

#   # Inject custom stuff into .zshrc
#    cp /vagrant/files/.zshrc_custom ~/.zshrc_custom
#
#    if ! grep '/# Custom Injected code 2389724823748234/' ~/.zshrc
#    then
#        cat<<EOF >> ~/.zshrc
## Custom Injected code 2389724823748234
#source ~/.zshrc_custom
## End of Custom Injected code 2389724823748234
#EOF
#    fi
#
#    # Setup repos folder
#    source ~/.zshrc_custom
}


# Install Zsh and OhMyZsh
installZsh

echo "*** install terminator ***"
yum install -y terminator


echo "***** Fin terminals *****"
