## .zshenv

# PATH
if [ -e ~/.path.sh ]; then
    source ~/.path.sh

    if [ -e ~/local/bin/asdf ]; then
        fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
    fi
fi

# 重複を除去
typeset -U path manpath
