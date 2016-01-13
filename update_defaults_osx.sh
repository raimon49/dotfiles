#!/bin/sh

set -eu

[ "$(uname)" != "Darwin" ] && exit 1

# KeyRepeat
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Disable HotPlug
defaults write com.apple.ImageCapture disableHotPlug -bool YES

# Disable generate .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool YES

# Show all extensions at Finder.app
defaults write com.apple.finder AppleShowAllFiles -bool NO
defaults write -g AppleShowAllExtensions -bool YES
