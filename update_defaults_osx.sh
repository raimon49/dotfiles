#!/bin/sh

set -eu

[ "$(uname)" != "Darwin" ] && exit 1

# KeyRepeat
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Disable HotPlug
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# Disable generate .DS_Store
defaults -currentHost write com.apple.desktopservices DSDontWriteNetworkStores -bool YES

# Show all extensions at Finder.app
defaults write com.apple.finder AppleShowAllFiles -bool NO
defaults write -g AppleShowAllExtensions -bool YES

# Disable shadow effect at screen capture
defaults write com.apple.screencapture disable-shadow -boolean YES

# Disable repeat inputting for VS Code
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
