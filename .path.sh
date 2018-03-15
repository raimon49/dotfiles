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
fi

export GOPATH="${HOME}/works/golang"
if [ -d ${GOPATH} ]; then
    export PATH="${GOPATH}/bin:${PATH}"
fi

# for Heroku Toolbelt
test -d /usr/local/heroku && export PATH="/usr/local/heroku/bin:${PATH}"

# for VVM
test -f ~/.vvm/etc/login && source ~/.vvm/etc/login

# for anyenv
export ANYENV_ROOT="${HOME}/.anyenv"
if [ -d "${ANYENV_ROOT}" ]; then
    export PATH="${HOME}/.anyenv/bin:${PATH}"
    eval "$(anyenv init -)"
fi

# for Python
export PIP_CONFIG_FILE="${HOME}/.pip.conf"
