#!/bin/sh

# nodebrew
[ ! -d ~/.nodebrew ] && \
    curl -L git.io/nodebrew | perl - setup

# pyenv
[ ! -d ~/.pyenv ] && \
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# rbenv
[ ! -d ~/.rbenv ] && \
    curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

# swiftenv
[ ! -d ~/.swiftenv ] && \
    git clone https://github.com/kylef/swiftenv.git ~/.swiftenv
