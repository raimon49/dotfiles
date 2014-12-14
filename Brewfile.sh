#!/bin/sh
# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Packages
brew install autoconf
brew install automake
brew install bdw-gc
brew install chisel
brew install fish
brew install gdbm
brew install git
brew install jq
brew install libtool
brew install lua
brew install lv
brew install mercurial
brew install nkf
brew install openssl
brew install pcre
brew install tig
brew install tree
brew install vim --with-lua --HEAD
brew install w3m
brew install wget
brew install zsh

# Remove outdated versions
brew cleanup
