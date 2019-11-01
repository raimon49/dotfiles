#!/bin/sh
cd $(dirname $0)
DOTFILES_REPO="${HOME}/works/git/dotfiles"
GIT_CONTRIB_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion"

[ ! -d "${HOME}/local/bin" ] && mkdir -p "${HOME}/local/bin"
[ ! -d "${HOME}/.zsh/cache" ] && mkdir -p "${HOME}/.zsh/cache"
[ ! -d "${HOME}/.config/nvim" ] && mkdir -p "${HOME}/.config/nvim"
[ ! -d "${HOME}/.config/git" ] && mkdir -p "${HOME}/.config/git"
[ ! -d "${HOME}/.config/Code/User" ] && mkdir -p "${HOME}/.config/Code/User"
[ ! -d "${HOME}/go" ] && mkdir -p "${HOME}/go"
[ ! -f "${HOME}/.z" ] && touch "${HOME}/.z"
[ ! -d .antigen ] && git clone https://github.com/zsh-users/antigen.git .antigen

# for Git on Bash
if [ -x "$(which wget 2> /dev/null)" ]; then
    wget "${GIT_CONTRIB_URL}/git-completion.bash" --no-check-certificate -q -O "${HOME}/local/bin/git-completion.bash"
    wget "${GIT_CONTRIB_URL}/git-prompt.sh" --no-check-certificate -q -O "${HOME}/local/bin/git-prompt.sh"
elif [ -x "$(which curl 2> /dev/null)" ]; then
    curl "${GIT_CONTRIB_URL}/git-completion.bash" -L -s -o "${HOME}/local/bin/git-completion.bash"
    curl "${GIT_CONTRIB_URL}/git-prompt.sh" -L -s -o "${HOME}/local/bin/git-prompt.sh"
fi

ln -Fis "${DOTFILES_REPO}/git-info/git-pager" "${HOME}/local/bin"
ln -Fis "${DOTFILES_REPO}/git-info/git-info" "${HOME}/local/bin"
ln -Fis "${DOTFILES_REPO}/tovim" "${HOME}/local/bin"
ln -Fis "${DOTFILES_REPO}/git-ls-branches/git-ls-branches" "${HOME}/local/bin"
ln -Fis "${DOTFILES_REPO}/.vim" "${HOME}/.config/nvim"
ln -Fis "${DOTFILES_REPO}/.config/git/ignore" "${HOME}/.config/git"
ln -Fis "${DOTFILES_REPO}/.config/Code/User/settings.json" "${HOME}/.config/Code/User"
ln -Fis "${DOTFILES_REPO}/.config/Code/User/keybindings.json" "${HOME}/.config/Code/User"
ln -Fis "${DOTFILES_REPO}/.vimrc" "${HOME}/.config/nvim/init.vim"

for dotfile in .?*; do
    case "${dotfile}" in
        .. | .git | .gitmodules | .travis.yml )
            # ignore
            continue;;
        *)
            # symlink
            ln -Fis "${PWD}/${dotfile}" "${HOME}"
            ;;
    esac
done
