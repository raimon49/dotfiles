#!/bin/sh

# gibo
GIBO_PATH="${HOME}/local/bin/gibo"
[ ! -f "${GIBO_PATH}" ] && \
    curl -L https://github.com/simonwhitaker/gibo/raw/2.2.8/gibo \
        -o "${GIBO_PATH}" && chmod +x "${GIBO_PATH}" && "${GIBO_PATH}" update
