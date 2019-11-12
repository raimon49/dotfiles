#!/bin/sh
[ -e "${HOME}/.gitconfig" ] && \
grep "name = raimon" "${HOME}/.gitconfig" && \
[ -e "${HOME}/.bash_profile" ] && \
[ -e "${HOME}/.bashrc" ] && \
grep "HISTFILESIZE=1000000" "${HOME}/.bashrc" && \
[ -e "${HOME}/.zshenv" ] && \
[ -e "${HOME}/.zshrc" ] && \
grep "SAVEHIST=1000000" "${HOME}/.zshrc" && \
[ -e "${HOME}/.path.sh" ] && \
echo ${PATH} | grep "${HOME}/local/bin:" && \
echo "OK: dot symlinks"
