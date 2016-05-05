## .env.sh

export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export EDITOR=vim
export SVN_EDITOR=vim
export SCREENDIR="${HOME}/.screen"
export LSCOLORS=gxFxCxdxBxegedabagacad
export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
if [ -x "`which lv 2> /dev/null`" ]; then
    export PAGER=lv
    export LV="-Ou8 -c -Sh1;36 -Su1;4;32 -Ss7;37;1;33"
elif [ -x "`which less 2> /dev/null`" ]; then
    export PAGER=less
    export LESS="-R"
    export LESSCHARSET=utf-8
    alias lv="less"
fi

# See also: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
test -x /usr/local/bin/brew && export HOMEBREW_NO_ANALYTICS=1

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;36m") \
        LESS_TERMCAP_md=$(printf "\e[1;36m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
