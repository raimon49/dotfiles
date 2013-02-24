## .alias.sh

case "${OSTYPE}" in
    freebsd*|darwin*)
    alias ls="ls -G -w"
    alias llc="CLICOLOR_FORCE=1 ls -laF"
    ;;
    linux*|cygwin*)
    alias ls="ls --color=auto"
    alias llc="ls -laF --color=always"
    ;;
esac

case "`uname`" in
    FreeBSD | OpenBSD | NetBSD | SunOS)
    if [ -x "$(which gmake 2> /dev/null)" ]; then
        alias make="gmake"
    fi
    ;;
esac

alias l="ls -CF"
alias ll="ls -laF"
alias cls="clear;ls"
alias sudo="sudo -E "
alias view="vim -R"
alias rawvim="vim -u NONE -U NONE --noplugin -c 'set nu' -c 'syntax enable'"
alias zmv="noglob zmv"
alias screen="screen -U"
alias scpqa="scp -C -c arcfour"
alias rsyncqa="rsync -az -e 'ssh -c arcfour'"
alias scpqb="scp -C -c blowfish"
alias rsyncqb="rsync -az -e 'ssh -c blowfish'"
alias :q="exit"
if [ -n "${ZSH_VERSION}" ]; then
    alias -g C=" | wc -l"
    alias -g H=" | head"
    alias -g T=" | tail"
    alias -g L=" | ${PAGER}"
    alias -g V=" | vim -R -"
    alias -g W=" | w3m -no-cookie -T text/html"
fi
