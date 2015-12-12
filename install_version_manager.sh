#!/bin/sh

# nodebrew
[ ! -d ~/.nodebrew ] && \
    curl -L git.io/nodebrew | perl - setup

# pyenv
[ ! -d ~/.pyenv ] && \
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# rbenv
[ ! -d ~/.rbenv ] && \
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
