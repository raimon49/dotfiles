#!/bin/sh

# anyenv

ANYENV_PATH="${HOME}/anyenv"
[ ! -d "${ANYENV_PATH}" ] && \
    git clone https://github.com/riywo/anyenv ~/.anyenv
    mkdir "${ANYENV_PATH}/plugins"
    git clone https://github.com/znz/anyenv-git.git "${ANYENV_PATH}/plugins/anyenv-git"
    git clone https://github.com/znz/anyenv-update.git "${ANYENV_PATH}/plugins/anyenv-update"
