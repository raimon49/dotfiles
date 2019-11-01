#!/bin/sh

# gibo
GIBO_PATH="${HOME}/local/bin/gibo"
[ ! -f "${GIBO_PATH}" ] && \
    curl -L https://raw.github.com/simonwhitaker/gibo/master/gibo \
        -o "${GIBO_PATH}" && chmod +x "${GIBO_PATH}" && "${GIBO_PATH}gibo" update
