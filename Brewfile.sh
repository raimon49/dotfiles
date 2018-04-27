#!/bin/sh
# Tap user repository
brew tap neovim/neovim

# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Official packages
if [ -x /usr/local/bin/vim ]; then
    brew uninstall vim
fi

brew install autoconf
brew install automake
brew install bdw-gc
brew install carthage
brew install chisel
brew install cocoapods
brew install fish
brew install gdbm
brew install git
brew install heroku-toolbelt
brew install icdiff
brew install jq
brew install libtool
brew install lua
brew install lv
brew install mercurial
brew install mycli
brew install neovim
brew install nkf
brew install openssl
brew install peco
brew install pcre
brew install pgcli
brew install python3
brew install spark
brew install tig
brew install tree
brew install swiftlint
brew install vim --with-lua --HEAD
brew install w3m
brew install webp
brew install wget
brew install --without-etcdir zsh

# Remove outdated versions
brew cleanup
