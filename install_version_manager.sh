#!/bin/sh

install_linuxbrew_in_local() {
    git clone --depth 3 https://github.com/Homebrew/brew "${HOME}/.linuxbrew/Homebrew"
    mkdir "${HOME}/.linuxbrew/bin"
    ln -s "${HOME}/.linuxbrew/Homebrew/bin/brew" "${HOME}/.linuxbrew/bin"
    eval $(${HOME}/.linuxbrew/bin/brew shellenv)
}

# anyenv
ANYENV_PATH="${HOME}/.anyenv"
[ ! -d "${ANYENV_PATH}" ] && \
    git clone https://github.com/riywo/anyenv ~/.anyenv
    mkdir "${ANYENV_PATH}/plugins"
    git clone https://github.com/znz/anyenv-git.git "${ANYENV_PATH}/plugins/anyenv-git"
    git clone https://github.com/znz/anyenv-update.git "${ANYENV_PATH}/plugins/anyenv-update"

# Linuxbrew
if which apt-get >/dev/null 2>&1 ; then
    sudo apt-get install build-essential curl file git -y

    install_linuxbrew_in_local
elif which yum >/dev/null 2>&1 ; then
    sudo yum groupinstall 'Development Tools' -y
    sudo yum install curl file git -y

    install_linuxbrew_in_local
fi
