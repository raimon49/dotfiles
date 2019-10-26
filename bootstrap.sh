#!/bin/sh
if [ ! -x "$(which git 2> /dev/null)" ]; then
    echo "git not found."
    exit 1
fi

DOTFILES="${HOME}/works/git"

[ ! -d "${DOTFILES}" ] && mkdir -p "${DOTFILES}"
cd "${DOTFILES}" && git clone --recursive https://github.com/raimon49/dotfiles.git && cd dotfiles && yes | ./install_cui.sh

printf "\nbootstrapped.\n"
exit 0
