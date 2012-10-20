## .zshrc

# バージョン情報
autoload -Uz is-at-least

# emacsキーバインド
bindkey -e

# ENV
# システム側(/etc/profile, /etc/zshrc)で上書きされないようにここで設定
if [ -e ~/.env.sh ]; then
    source ~/.env.sh
fi

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history
setopt interactive_comments
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
if is-at-least 4.3.9; then
    bindkey "^R" history-incremental-pattern-search-backward
fi
function history-all {
    history -E 1
}

# 補完
if [ -d ~/.zsh-completions ]; then
    fpath=(~/.zsh-completions/src $fpath)
fi
autoload -U compinit
compinit

# キャッシュ
if [ -d ~/.zsh/cache ]; then
    zstyle ':completion:*' use-cache yes
    zstyle ':completion:*' cache-path ~/.zsh/cache
fi

# 補完リストの色付け
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

# プロセスID補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# グロブ展開せずに選ぶ
setopt glob_complete

# =の後も展開
setopt magic_equal_subst

# プロンプト
setopt transient_rprompt
autoload colors
colors
VCS_PROMPT=""
if is-at-least 4.3.7; then
    autoload -Uz vcs_info
    if is-at-least 4.3.10; then
        zstyle ':vcs_info:git:*' check-for-changes true
        zstyle ':vcs_info:git:*' stagedstr "+"
        zstyle ':vcs_info:git:*' unstagedstr "-"
    fi
    zstyle ':vcs_info:*' branchformat '%b:r%r'
    zstyle ':vcs_info:*' formats ':(%s)%b %c%u'
    zstyle ':vcs_info:*' actionformats ':(%s)%b|%a %c%u'
    precmd () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

        # git stash count
        [[ -e $PWD/.git/refs/stash ]] && psvar[2]=" ($(git stash list 2>/dev/null | wc -l) stashed)"
    }
    VCS_PROMPT="%1(v|%F{magenta}%1v%2v%f|)"
fi
PROMPT="%{${fg[green]}%}[%n@%m]${VCS_PROMPT}%{${fg[green]}%}%{${reset_color}%} %{${fg[yellow]}%}%100<..<%~%{${reset_color}%}
%(!.#.$) "
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[zsh ${ZSH_VERSION}]%{${reset_color}%}"
unset VCS_PROMPT

# ファイルリネーム
autoload zmv

# 自動エスケープ
echo ${^fpath}/url-quote-magic(N) | grep -q url-quote-magic && autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic

# ディレクトリ移動
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup
function wg {
    cd ~/works/git/$1
}
function _wg {
    _files -W ~/works/git/ && return 0;
    return 1;
}
function wh {
    cd ~/works/hg/$1
}
function _wh {
    _files -W ~/works/hg/ && return 0;
    return 1;
}
function ws {
    cd ~/works/svn/$1
}
function _ws {
    _files -W ~/works/svn/ && return 0;
    return 1;
}
compdef _wg wg
compdef _wh wh
compdef _ws ws

# コマンド自動修正
setopt correct

# 補完リストを詰める
setopt list_packed

# ビープ音抑止
setopt nolistbeep

# bash風リダイレクト
setopt no_multios

# 拡張グロブ
setopt extended_glob

# ユーティリティ
function alc() {
    if [ -n "$1" ]; then
        w3m -no-cookie "http://eow.alc.co.jp/${1}/UTF-8/?ref=sa" | sed '1,38d' | ${PAGER}
    else
        echo 'usage: alc word'
    fi
}

# プロセスの実行時間が指定秒以上だった時にレポート表示
REPORTTIME=3

# エイリアス
if [ -e ~/.alias.sh ]; then
    source ~/.alias.sh
fi
