#!/bin/sh
if [ ! -x "$(which git 2> /dev/null)" ]; then
    echo "git not found."
    exit 1
fi

[ ! -d ~/works/git ] && mkdir -p ~/works/git
cd ~/works/git && git clone --recursive https://github.com/raimon49/dotfiles.git && cd dotfiles && yes | ./install_cui.sh

printf "\nbootstrapped.\n"
exit 0
