#!/bin/sh

# TODO mv ~/old_files

mkdir -p ~/local/bin
mkdir -p ~/.zsh/cache

ln -s ~/works/git/dotfiles/.gitconfig       ~
ln -s ~/works/git/dotfiles/.hgrc            ~
ln -s ~/works/git/dotfiles/.screenrc        ~
ln -s ~/works/git/dotfiles/.vim             ~
ln -s ~/works/git/dotfiles/.vimrc           ~
ln -s ~/works/git/dotfiles/.vimshrc         ~
ln -s ~/works/git/dotfiles/.zsh-completions ~
ln -s ~/works/git/dotfiles/.env.sh          ~
ln -s ~/works/git/dotfiles/.alias.sh        ~
ln -s ~/works/git/dotfiles/.bashrc          ~
ln -s ~/works/git/dotfiles/.zshenv          ~
ln -s ~/works/git/dotfiles/.zshrc           ~

ln -s ~/works/git/dotfiles/git-info/git-pager ~/local/bin
ln -s ~/works/git/dotfiles/git-info/git-info ~/local/bin
