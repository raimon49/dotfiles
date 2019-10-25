#!/bin/sh

# anyenv
[ ! -d "${HOME}/.anyenv" ] && \
    git clone https://github.com/riywo/anyenv ~/.anyenv
    mkdir "${HOME}/.anyenv/plugins"
    git clone https://github.com/znz/anyenv-git.git "${HOME}/.anyenv/plugins/anyenv-git"
    git clone https://github.com/znz/anyenv-update.git "${HOME}/.anyenv/plugins/anyenv-update"
