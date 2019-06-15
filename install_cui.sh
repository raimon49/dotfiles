#!/bin/sh
cd $(dirname $0)
DOTFILES_REPO="~/works/git/dotfiles"
GIT_CONTRIB_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion"

[ ! -d ~/local/bin ] && mkdir -p ~/local/bin
[ ! -d ~/.zsh/cache ] && mkdir -p ~/.zsh/cache
[ ! -d ~/.config/nvim ] && mkdir -p ~/.config/nvim
[ ! -d ~/.config/git ] && mkdir -p ~/.config/git
[ ! -d ~/.config/Code/User ] && mkdir -p ~/.config/Code/User
[ ! -d ~/go ] && mkdir -p ~/go
[ ! -f ~/.z ] && touch ~/.z
[ ! -d .antigen ] && git clone https://github.com/zsh-users/antigen.git .antigen

# for Git on Bash
if [ -x "$(which wget 2> /dev/null)" ]; then
    wget "${GIT_CONTRIB_URL}/git-completion.bash" --no-check-certificate -q -O ~/local/bin/git-completion.bash
    wget "${GIT_CONTRIB_URL}/git-prompt.sh" --no-check-certificate -q -O ~/local/bin/git-prompt.sh
elif [ -x "$(which curl 2> /dev/null)" ]; then
    curl "${GIT_CONTRIB_URL}/git-completion.bash" -L -s -o ~/local/bin/git-completion.bash
    curl "${GIT_CONTRIB_URL}/git-prompt.sh" -L -s -o ~/local/bin/git-prompt.sh
fi

ln -Fis "${DOTFILES_REPO}/git-info/git-pager" ~/local/bin
ln -Fis "${DOTFILES_REPO}/git-info/git-info" ~/local/bin
ln -Fis "${DOTFILES_REPO}/tovim" ~/local/bin
ln -Fis "${DOTFILES_REPO}/git-ls-branches/git-ls-branches" ~/local/bin
ln -Fis "${DOTFILES_REPO}/.vim" ~/.config/nvim
ln -Fis "${DOTFILES_REPO}/.config/git/ignore" ~/.config/git
ln -Fis "${DOTFILES_REPO}/.config/Code/User/settings.json" ~/.config/Code/User
ln -Fis "${DOTFILES_REPO}/.config/Code/User/keybindings.json" ~/.config/Code/User
ln -Fis "${DOTFILES_REPO}/.vimrc" ~/.config/nvim/init.vim

for dotfile in .?*; do
    case "${dotfile}" in
        .. | .git | .gitmodules | .travis.yml )
            # ignore
            continue;;
        *)
            # symlink
            ln -Fis "${PWD}/${dotfile}" ~
            ;;
    esac
done
