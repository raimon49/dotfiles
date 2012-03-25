## .env.sh

export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export EDITOR=vim
export SVN_EDITOR=vim
export SCREENDIR="${HOME}/.screen"
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
if [ -x "`which lv 2> /dev/null`" ]; then
    export PAGER=lv
    export LV="-Ou8 -c"
elif [ -x "`which less 2> /dev/null`" ]; then
    export PAGER=less
    export LESS="-R"
    export LESSCHARSET=utf-8
    alias lv="less"
fi
