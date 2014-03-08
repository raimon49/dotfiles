## .path.sh

# for Mac
if [ -x /usr/libexec/path_helper ]; then
    PATH=""
    MANPATH=""
    eval `/usr/libexec/path_helper -s`
fi

export PATH="${HOME}/local/bin:${PATH}"
export MANPATH="${HOME}/local/share/man:${MANPATH}"

# for VVM
test -f ~/.vvm/etc/login && source ~/.vvm/etc/login

# for Node
test -f ~/.nodebrew/nodebrew && export PATH="${HOME}/.nodebrew/current/bin:${PATH}"

# for Python
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
fi
