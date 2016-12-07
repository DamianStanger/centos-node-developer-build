#!/usr/bin/env bash

echo "***** Running terminals *****"

user_name=$1

function installZsh {

    echo '*** Installing ZSH ***'
    yum install -y zsh
    chsh -s /bin/zsh
    chsh -s /bin/zsh $user_name
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
export SHELL='/bin/zsh' # Do this so that the nvm install script modifies the .zshrc instead of .bashrc
su - $user_name -c "export SHELL='/bin/zsh'"


echo "*** install terminator ***"
yum install -y terminator


echo "***** Fin terminals *****"
