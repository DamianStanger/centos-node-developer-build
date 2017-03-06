#!/usr/bin/env bash

echo "***** Running terminals *****"

user_name=$1

function installZsh {

    echo '*** Installing ZSH ***'
    yum install -y zsh
    chsh -s /bin/zsh
    chsh -s /bin/zsh cent
    # [ -f ~/.bashrc ] || rm ~/.bashrc

    echo "*** Install OhMyZsh ***"
    curl -LO https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh   
    sh install.sh
    rm install.sh
    su - $user_name -c "curl -LO https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh ;sh install.sh;rm install.sh"   

    echo "*** Change the OhMyZsh theme ***"
    echo 'ZSH_THEME="ys"' >> .zshrc
    su - $user_name -c "echo 'ZSH_THEME=\"ys\"' >> .zshrc"

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

function installTerminator {
    echo "*** install terminator ***"
    if [ ! -f /usr/bin/terminator ]
    then
        yum install -y terminator
        su - $user_name -c 'mkdir -p ~/.config/terminator/'
        su - $user_name -c 'cat<<EOF > ~/.config/terminator/config 
[global_config]
  suppress_multiple_term_dialog = True
[keybindings]
  line_down = <Primary>Down
  line_up = <Primary>Up
  next_tab = None
  page_down = <Primary>Page_Down
  page_up = <Primary>Page_Up
  prev_tab = None
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    background_image = None
    scrollback_lines = 99999
EOF'
    fi
}



# Install Zsh and OhMyZsh
installZsh
export SHELL='/bin/zsh' # Do this so that the nvm install script modifies the .zshrc instead of .bashrc
su - $user_name -c "export SHELL='/bin/zsh'"


installTerminator


echo "*** install figlet ***"
yum install -y figlet


echo "***** Fin terminals *****"
