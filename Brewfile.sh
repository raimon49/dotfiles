#!/bin/sh
# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Packages
brew install autoconf  || true
brew install automake  || true
brew install bdw-gc  || true
brew install chisel || true
brew install fish  || true
brew install gdbm  || true
brew install git  || true
brew install libtool  || true
brew install lv  || true
brew install nkf  || true
brew install openssl  || true
brew install pcre  || true
brew install tig  || true
brew install tree  || true
brew install w3m  || true
brew install wget  || true
brew install zsh  || true

# Remove outdated versions
brew cleanup
