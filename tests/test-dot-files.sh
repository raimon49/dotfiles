#!/bin/sh
[ -e "${HOME}/.gitconfig" ] && \
grep "name = raimon" "${HOME}/.gitconfig" && \
echo "OK: dot files"
