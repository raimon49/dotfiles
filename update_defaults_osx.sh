#!/bin/sh

set -eu

[ "$(uname)" != "Darwin" ] && exit 1

# KeyRepeat
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Disable HotPlug
defaults write -currentHost com.apple.ImageCapture disableHotPlug -bool YES

# Disable generate .DS_Store
defaults write -currentHost com.apple.desktopservices DSDontWriteNetworkStores -bool YES

# Show all files at Finder.app
defaults write -currentHost com.apple.finder AppleShowAllFiles -bool YES
