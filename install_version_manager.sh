#!/bin/sh

# anyenv
[ ! -d ~/.anyenv ] && \
    git clone https://github.com/riywo/anyenv ~/.anyenv
    mkdir ~/.anyenv/plugins
    git clone https://github.com/znz/anyenv-git.git ~/.anyenv/plugins/anyenv-git
    git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
