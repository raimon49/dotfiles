#!/bin/sh
cd $(dirname $0)

[ ! -d ~/local/bin ] && mkdir -p ~/local/bin
[ ! -d ~/.zsh/cache ] && mkdir -p ~/.zsh/cache
[ ! -d ~/.config ] && mkdir ~/.config
[ ! -d ~/go ] && mkdir -p ~/go
[ ! -f ~/.z ] && touch ~/.z
[ ! -d .antigen ] && git clone https://github.com/zsh-users/antigen.git .antigen

# for Git on Bash
if [ -x "$(which wget 2> /dev/null)" ]; then
    wget 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash' --no-check-certificate -q -O ~/local/bin/git-completion.bash
    wget 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' --no-check-certificate -q -O ~/local/bin/git-prompt.sh
elif [ -x "$(which curl 2> /dev/null)" ]; then
    curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash' -L -s -o ~/local/bin/git-completion.bash
    curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' -L -s -o ~/local/bin/git-prompt.sh
fi

ln -Fis ~/works/git/dotfiles/git-info/git-pager ~/local/bin
ln -Fis ~/works/git/dotfiles/git-info/git-info ~/local/bin
ln -Fis ~/works/git/dotfiles/tovim ~/local/bin
ln -Fis ~/works/git/dotfiles/git-ls-branches/git-ls-branches ~/local/bin

for dotfile in .?*; do
    case $dotfile in
        .. | .git | .gitmodules )
            # ignore
            continue;;
        *)
            # symlink
            ln -Fis "$PWD/$dotfile" ~
            ;;
    esac
done
