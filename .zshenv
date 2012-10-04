## .zshenv

# PATH
if [ -e ~/.path.sh ]; then
    source ~/.path.sh
fi

# 重複を除去
typeset -U path manpath
