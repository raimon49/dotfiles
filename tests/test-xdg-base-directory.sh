#!/bin/sh
[ -e "${HOME}/.config/nvim" ] && \\
[ -e "${HOME}/.config/nvim/init.vim" ] && \\
[ -e "${HOME}/.config/git/ignore" ] && \\
[ -e "${HOME}/.config/Code/User/settings.json" ] && \\
[ -e "${HOME}/.config/Code/User/keybindings.json" ] && \\
echo "OK: XDG Base Directory"
