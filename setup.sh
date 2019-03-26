#!/bin/bash

check_exit_status() {

    if [ $? -eq 0 ]
    then
        echo
        echo "Success"
        echo
    else
        echo
        echo "[ERROR] Process Failed!"
        echo

        read -p "The last command exited with an error. Exit script? (y/n) " answer

        if [ "$answer" == "y" ] || [ "$answer" == "Y" ]
        then
            exit 1
        fi
    fi
}

begin() {

    echo
    echo "--------------------"
    echo "-  Initializing!   -"
    echo "--------------------"
    echo
}

update() {
    sudo apt -y update;
    sudo apt -y upgrade;
    sudo apt -y dist-upgrade;

    check_exit_status
}

install() {
    sudo apt install -y wget curl git git-flow zip unzip terminator xclip npm nodejs node-legacy;

    check_exit_status
}

zsh() {
    cd ~;
    sudo apt install -y zsh;
    chsh -s $(which zsh);
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k;

    check_exit_status
}

docker() {
    cd ~;
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common;
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable";
    sudo apt install -y docker-ce;

    # without sudo
    sudo usermod -aG docker ${USER};
    su - ${USER};
    id -nG;

    # docker compose
    sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
    sudo chmod +x /usr/local/bin/docker-compose;

    check_exit_status
}

yarn() {
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -;
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list;
    sudo apt install -y yarn;

    check_exit_status
}

snap() {
    sudo apt install -y snapd;

    # sudo snap install go --classic;
    sudo snap install -y vscode --classic;
    sudo snap install -y phpstorm --classic;
    sudo snap install -y pycharm-community --classic;
    sudo snap install -y skype --classic
    sudo snap install -y insomnia;

    check_exit_status
}

nginx() {
    sudo apt install -y nginx;
    sudo ufw allow 'Nginx HTTP';
    sudo ufw enable;

    check_exit_status
}

php() {
    sudo apt install -y php;
    sudo apt install -y php-{cli,bcmath,bz2,intl,gd,mbstring,mysql,zip,fpm,gettext};
    systemctl restart nginx.service;

    check_exit_status
}

python3() {
    sudo apt install -y python3;
    sudo apt install -y python3-pip;

    check_exit_status
}

nerd_fonts() {
    cd ~ && git clone https://github.com/ryanoasis/nerd-fonts.git;
    cd nerd-fonts;
    ./install.sh;
    cd ~;

    check_exit_status
}

housekeeping() {

    sudo apt -y autoremove;
    sudo apt -y autoclean;
    sudo updatedb;

    check_exit_status
}

leave() {

    echo
    echo "--------------------"
    echo "- Setup Completed! -"
    echo "--------------------"
    echo
    exit
}

## setup begin ##

begin
# update
# zsh
# docker
# yarn
# snap
# nginx
# php
# python3
# nerd_fonts
housekeeping
leave