## .alia.sh

case "${OSTYPE}" in
    freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
    linux*|cygwin*)
    alias ls="ls --color=auto"
    ;;
esac
alias l="ls -CF"
alias ll="ls -laF"
alias sudo="sudo -E "
alias view="vim -R"
alias rawvim="vim -u NONE -U NONE --noplugin -c 'set nu' -c 'syntax enable'"
alias zmv="noglob zmv"
alias screen="screen -U"
alias :q="exit"
if [ -n "${ZSH_VERSION}" ]; then
    alias -g C=" | wc -l"
    alias -g H=" | head"
    alias -g T=" | tail"
    alias -g L=" | ${PAGER}"
    alias -g V=" | vim -R -"
    alias -g W=" | w3m -T text/html"
fi
