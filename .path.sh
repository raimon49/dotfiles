## .path.sh

# for Mac
if [ -x /usr/libexec/path_helper ]; then
    PATH=""
    MANPATH=""
    eval `/usr/libexec/path_helper -s`
fi

export PATH="${HOME}/local/bin:${PATH}"
export MANPATH="${HOME}/local/share/man:${MANPATH}"
export XDG_CONFIG_HOME="${HOME}/.config"

# for Golang
export GOROOT="${HOME}/go"
if [ -d ${GOROOT} ]; then
    export PATH="${GOROOT}/bin:${PATH}"
    export GOPATH="${HOME}/works/golang"
    export PATH="${GOPATH}/bin:${PATH}"
fi

# for Heroku Toolbelt
test -d /usr/local/heroku && export PATH="/usr/local/heroku/bin:${PATH}"

# for VVM
test -f ~/.vvm/etc/login && source ~/.vvm/etc/login

# for Node
test -f ~/.nodebrew/nodebrew && export PATH="${HOME}/.nodebrew/current/bin:${PATH}"

# for Python
export PIP_CONFIG_FILE="${HOME}/.pip.conf"
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
fi

# for Ruby
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d ${RBENV_ROOT} ]; then
    export PATH="${RBENV_ROOT}/bin:${PATH}"
    eval "$(rbenv init -)"
fi
