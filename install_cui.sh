#!/bin/sh
cd $(dirname $0)

[ ! -d ~/local/bin ] && mkdir -p ~/local/bin
[ ! -d ~/.zsh/cache ] && mkdir -p ~/.zsh/cache

# for Git on Bash
if [ -x "$(which wget 2> /dev/null)" ]; then
    wget 'https://github.com/git/git/raw/master/contrib/completion/git-completion.bash' --no-check-certificate -O ~/local/bin/git-completion.bash
    wget 'https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh' --no-check-certificate -O ~/local/bin/git-prompt.sh
elif [ -x "$(which curl 2> /dev/null)" ]; then
    curl 'https://github.com/git/git/raw/master/contrib/completion/git-completion.bash' -L -o ~/local/bin/git-completion.bash
    curl 'https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh' -L -o ~/local/bin/git-prompt.sh
fi

ln -Fis ~/works/git/dotfiles/git-info/git-pager ~/local/bin
ln -Fis ~/works/git/dotfiles/git-info/git-info ~/local/bin

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
