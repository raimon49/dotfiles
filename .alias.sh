## .alias.sh

case "${OSTYPE}" in
    freebsd*|darwin*)
    alias ls="ls -G -w"
    alias llc="CLICOLOR_FORCE=1 ls -laF"
    alias tac="tail -r"
    ;;
    linux*|cygwin*)
    alias ls="ls --color=auto"
    alias llc="ls -laF --color=always"
    ;;
esac

case "`uname`" in
    FreeBSD | OpenBSD | NetBSD | SunOS)
    if [ -x "$(command -v gmake)" ]; then
        alias make="gmake"
    fi
    ;;
esac

alias l="ls -CF"
alias ll="ls -laF"
alias cls="clear;ls"
alias lsport="sudo lsof -i -n -P"
alias mkdir="mkdir -p"
alias sudo="sudo -E "
alias view="vim -R"
alias rawvim="vim -u NONE -U NONE -i NONE --noplugin -c 'set nu' -c 'syntax enable'"
alias vi="rawvim"
alias bingrep="grep -a"
alias ggrep="git grep --no-index --break --heading -I -i -n"
alias cdu="cd-gitroot"
alias zmv="noglob zmv -W"
alias screen="screen -U"
alias hostname="uname -n"
alias scpqa="scp -C -c arcfour"
alias rsyncqa="rsync -az -e 'ssh -c arcfour'"
alias scpqb="scp -C -c blowfish"
alias rsyncqb="rsync -az -e 'ssh -c blowfish'"
alias :q="exit"
alias :qa="exit"

if [ -n "${BASH_VERSION}" ]; then
    alias rehash="hash -r"
fi

if [ -x "$(command -v tree)" ]; then
    alias tree="tree --charset -"
else
    alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
fi

if [ -n "${ZSH_VERSION}" ]; then
    alias -g C=" | wc -l"
    alias -g H=" | head"
    alias -g T=" | tail"
    alias -g L=" | ${PAGER}"
    alias -g V=" | vim -R -"
    alias -g W=" | w3m -no-cookie -T text/html"

    # Copy stdin to clipboad
    if [ -x "$(command -v pbcopy)" ]; then
        # Mac
        alias -g P=' | pbcopy'
    elif [ -x "$(command -v xsel)" ]; then
        # Linux
        alias -g P=' | xsel --input --clipboard'
    elif [ -x "$(command -v putclip)" ]; then
        # Cygwin
        alias -g P=' | putclip'
    elif [ -x "$(command -v pbcopy_win)" ]; then
        # WSL 2
        alias -g P=' | pbcopy_win'
    fi
fi
