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
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool NO

# Show percentage of battery
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Show date and time in menu bar
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE) H:mm:ss"

# Limit Spotlight search to Applications and Calculator
defaults write com.apple.spotlight orderedItems -array \
    '{"enabled" = 1; "name" = "APPLICATIONS";}' \
    '{"enabled" = 0; "name" = "SOURCE";}' \
    '{"enabled" = 0; "name" = "SYSTEM_PREFS";}' \
    '{"enabled" = 0; "name" = "BOOKMARKS";}' \
    '{"enabled" = 0; "name" = "CONTACT";}' \
    '{"enabled" = 0; "name" = "DIRECTORIES";}' \
    '{"enabled" = 0; "name" = "DOCUMENTS";}' \
    '{"enabled" = 0; "name" = "EVENT_TODO";}' \
    '{"enabled" = 0; "name" = "FONTS";}' \
    '{"enabled" = 0; "name" = "IMAGES";}' \
    '{"enabled" = 0; "name" = "MENU_CONVERSION";}' \
    '{"enabled" = 0; "name" = "MENU_DEFINITION";}' \
    '{"enabled" = 1; "name" = "MENU_EXPRESSION";}' \
    '{"enabled" = 0; "name" = "MENU_OTHER";}' \
    '{"enabled" = 0; "name" = "MENU_SPOTLIGHT_SUGGESTIONS";}' \
    '{"enabled" = 0; "name" = "MESSAGES";}' \
    '{"enabled" = 0; "name" = "MOVIES";}' \
    '{"enabled" = 0; "name" = "MUSIC";}' \
    '{"enabled" = 0; "name" = "PDF";}' \
    '{"enabled" = 0; "name" = "PRESENTATIONS";}' \
    '{"enabled" = 0; "name" = "SPREADSHEETS";}'

# Re-affected for apps
for app in Finder Dock SystemUIServer; do killall "${app}" >/dev/null 2>&1; done

exit 0
