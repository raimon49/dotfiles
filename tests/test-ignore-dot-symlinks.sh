#!/bin/sh
[ ! -e "${HOME}/.git" ] && \
[ ! -e "${HOME}/.gitmodules" ] && \
[ ! -e "${HOME}/.travis.yml" ] && \
echo "OK: ignore dot symlinks"
