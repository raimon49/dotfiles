#!/bin/sh

# TODO mv ~/old_files

mkdir -p ~/local/bin
mkdir -p ~/.zsh/cache

# for Git on Bash
if [ -x "`which wget 2> /dev/null`" ]; then
    wget 'https://github.com/git/git/raw/master/contrib/completion/git-completion.bash' --no-check-certificate -O ~/local/bin/git-completion.bash
    wget 'https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh' --no-check-certificate -O ~/local/bin/git-prompt.sh
elif [ -x "`which curl 2> /dev/null`" ]; then
    curl 'https://github.com/git/git/raw/master/contrib/completion/git-completion.bash' -L -o ~/local/bin/git-completion.bash
    curl 'https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh' -L -o ~/local/bin/git-prompt.sh
fi

ln -s ~/works/git/dotfiles/.gitconfig       ~
ln -s ~/works/git/dotfiles/.hgrc            ~
ln -s ~/works/git/dotfiles/.hgeditor        ~
ln -s ~/works/git/dotfiles/.screenrc        ~
ln -s ~/works/git/dotfiles/.vim             ~
ln -s ~/works/git/dotfiles/.vimrc           ~
ln -s ~/works/git/dotfiles/.vimshrc         ~
ln -s ~/works/git/dotfiles/.zsh-completions ~
ln -s ~/works/git/dotfiles/.path.sh         ~
ln -s ~/works/git/dotfiles/.env.sh          ~
ln -s ~/works/git/dotfiles/.alias.sh        ~
ln -s ~/works/git/dotfiles/.bashrc          ~
ln -s ~/works/git/dotfiles/.zshenv          ~
ln -s ~/works/git/dotfiles/.zshrc           ~

ln -s ~/works/git/dotfiles/git-info/git-pager ~/local/bin
ln -s ~/works/git/dotfiles/git-info/git-info ~/local/bin
