#!/bin/sh

install_linuxbrew_in_local() {
    git clone --depth 3 https://github.com/Homebrew/brew "${HOME}/.linuxbrew/Homebrew"
    mkdir "${HOME}/.linuxbrew/bin"
    ln -sfni "${HOME}/.linuxbrew/Homebrew/bin/brew" "${HOME}/.linuxbrew/bin"
    eval $(${HOME}/.linuxbrew/bin/brew shellenv)
}

# asdf
ASDF_PATH="${HOME}/.asdf"
[ ! -d "${ASDF_PATH}" ] && \
    git clone https://github.com/asdf-vm/asdf.git "${ASDF_PATH}" && \
    cd "${ASDF_PATH}" && \
    git checkout "$(git describe --abbrev=0 --tags)" && \
    cd ..


# Linuxbrew
if which apt-get >/dev/null 2>&1 ; then
    sudo apt-get install build-essential curl file git -y

    install_linuxbrew_in_local
elif which yum >/dev/null 2>&1 ; then
    sudo yum groupinstall 'Development Tools' -y
    sudo yum install curl file git -y

    install_linuxbrew_in_local
fi
