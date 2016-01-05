#!/bin/sh

# gibo
[ ! -f ~/local/bin/gibo ] && \
    curl -L https://raw.github.com/simonwhitaker/gibo/master/gibo \
        -o ~/local/bin/gibo && chmod +x ~/local/bin/gibo && gibo -u
