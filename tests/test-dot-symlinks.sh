#!/bin/sh
[ -e "${HOME}/.gitconfig" ] && \
grep "name = raimon" "${HOME}/.gitconfig" && \
[ -e "${HOME}/.bash_profile" ] && \
[ -e "${HOME}/.bashrc" ] && \
grep "HISTFILESIZE=1000000" "${HOME}/.bashrc" && \
echo "OK: dot symlinks"
