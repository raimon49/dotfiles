#!/bin/sh
# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade --all

# Packages
brew install autoconf
brew install automake
brew install bdw-gc
brew install carthage
brew install chisel
brew install fish
brew install gdbm
brew install git
brew install icdiff
brew install jq
brew install libtool
brew install lua
brew install lv
brew install mercurial
brew install nkf
brew install openssl
brew install peco
brew install pcre
brew install rbenv
brew install ruby-build
brew install tig
brew install tree
brew install vim --with-lua --HEAD
brew install w3m
brew install webp
brew install wget
brew install --without-etcdir zsh

# Remove outdated versions
brew cleanup
