## .path.sh

# bookmarks
if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
    alias goto="cd -P"
fi

# for Mac
if [ -x /usr/libexec/path_helper ]; then
    PATH=""
    MANPATH=""
    eval `/usr/libexec/path_helper -s`
fi

export PATH="${HOME}/local/bin:${PATH}"
export MANPATH="${HOME}/local/share/man:${MANPATH}"
export XDG_CONFIG_HOME="${HOME}/.config"
test -d "${HOME}/.local/bin" && export PATH="${HOME}/.local/bin:${PATH}"

# for Android and Java
export ANDROID_HOME="${HOME}/Library/Android/sdk"
if [ -d "${ANDROID_HOME}" ]; then
    export PATH="${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}"
fi
MY_ANDROID_BUNDLE_JAVA="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
MACOS_JAVA="`/usr/libexec/java_home 2> /dev/null`"
if [ -d "${MACOS_JAVA}" ]; then
    export JAVA_HOME="${MACOS_JAVA}"
    export PATH="${JAVA_HOME}/bin:${PATH}"
elif [ -d "${MY_ANDROID_BUNDLE_JAVA}" ]; then
    export JAVA_HOME="${MY_ANDROID_BUNDLE_JAVA}"
    export PATH="${JAVA_HOME}/bin:${PATH}"
fi

# for Golang
export GOPATH="${HOME}/works/golang"
if [ -d "${GOPATH}" ]; then
    export PATH="${GOPATH}/bin:${PATH}"
fi

# for Heroku Toolbelt
test -d /usr/local/heroku && export PATH="/usr/local/heroku/bin:${PATH}"

# for VVM
test -f "${HOME}/.vvm/etc/login" && source "${HOME}/.vvm/etc/login"

# for Python
export PIP_CONFIG_FILE="${HOME}/.pip.conf"
export POETRY_HOME="${HOME}/.poetry"
test -d "${POETRY_HOME}/bin" && export PATH="${POETRY_HOME}/bin:${PATH}"

# for Linuxbrew
test -d "${HOME}/.linuxbrew" && eval $(${HOME}/.linuxbrew/bin/brew shellenv)

# for Rancher Desktop
test -d "${HOME}/.rd/bin" && export PATH="${HOME}/.rd/bin:${PATH}" && alias docker="nerdctl"
