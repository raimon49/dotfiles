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

# asdf
if [ -e ~/.asdf/asdf.sh ]; then
    source ~/.asdf/asdf.sh
    fpath=(${ASDF_DIR}/completions $fpath)
fi

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history
setopt interactive_comments
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
if is-at-least 4.3.9; then
    bindkey "^r" history-incremental-pattern-search-backward
fi
function history-all {
    history -E 1
}

# 直近コマンドラインスタックの表示
function show_buffer_stack() {
    POSTDISPLAY="
stack: $LBUFFER"
    zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey "^q" show_buffer_stack

# Plugins
if [[ -f ~/.antigen/antigen.zsh ]]; then
    source ~/.antigen/antigen.zsh
    antigen bundles <<EOBUNDLES
        zsh-users/zsh-completions src
        mollifier/cd-gitroot
        mollifier/anyframe
EOBUNDLES
    antigen apply
fi

# peco
for peco_command in ~/local/bin/peco /usr/local/bin/peco; do
    if [[ -x ${peco_command} ]]; then
        # ディレクトリ履歴移動
        bindkey '^xb' anyframe-widget-cdr

        # コマンド履歴からの実行
        bindkey '^xr' anyframe-widget-execute-history
        bindkey '^x^r' anyframe-widget-execute-history

        # コマンド履歴からの挿入
        bindkey '^xi' anyframe-widget-put-history
        bindkey '^x^i' anyframe-widget-put-history

        # プロセスkill
        bindkey '^xk' anyframe-widget-kill
        bindkey '^x^k' anyframe-widget-kill

        # Gitブランチ切り替え
        bindkey '^x^b' anyframe-widget-checkout-git-branch

        # Gitブランチ名の挿入
        bindkey '^xe' anyframe-widget-insert-git-branch
        bindkey '^x^e' anyframe-widget-insert-git-branch
    fi
done

# Ctrl-z復帰
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# 補完
autoload -Uz colors
autoload -Uz compinit
compinit -u

# キャッシュ
if [ -d ~/.zsh/cache ]; then
    zstyle ':completion:*' use-cache yes
    zstyle ':completion:*' cache-path ~/.zsh/cache
fi

# 補完リストの色付け
zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補が2つ以上あった時はメニュー補完モード
zstyle ':completion:*' menu select=2

# プロセスID補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# 上位のディレクトリへ移動する際に現在のディレクトリを補完候補から外す
zstyle ':completion:*' ignore-parents parent pwd ..

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{green}%d'$default
zstyle ':completion:*:warnings' format '%F{red}No matches for:''%F{green} %d'$default
zstyle ':completion:*:descriptions' format '%F{green}completing %B%d%b'$default
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{green}Completing %B%d%b%f'$default

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# コマンドオプションのセパレータを変更
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# 単語の途中でもカーソル位置で補完
setopt complete_in_word

# グロブ展開せずに選ぶ
setopt glob_complete

# =の後も展開
setopt magic_equal_subst

# プロンプト
setopt transient_rprompt
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
    function precmd_vcs() {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

        # git stash count
        [[ -e $PWD/.git/refs/stash ]] && psvar[2]=" ($(git stash list 2>/dev/null | wc -l) stashed)"
    }
    VCS_PROMPT="%1(v|%F{magenta}%1v%2v%f|)"
    precmd_functions=($precmd_functions precmd_vcs)
fi
PROMPT="%{${fg[green]}%}ret: %? [%n@%m]${VCS_PROMPT}%{${fg[green]}%}%{${reset_color}%} %{${fg[yellow]}%}%100<..<%~%{${reset_color}%}
%(!.#.$) "
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[zsh ${ZSH_VERSION}]%{${reset_color}%}"
unset VCS_PROMPT

# ファイルリネーム
autoload -Uz zmv

# 自動エスケープ
if [[ $ZSH_VERSION != 5.1.1 ]]; then
    for d in $fpath; do
        if [[ -e "$d/url-quote-magic" ]]; then
            if is-at-least 5.1; then
                autoload -Uz bracketed-paste-magic
                zle -N bracketed-paste bracketed-paste-magic
            fi
            autoload -Uz url-quote-magic
            zle -N self-insert url-quote-magic
            break
        fi
    done
fi

# ディレクトリ移動
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
if is-at-least 4.3.11; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':chpwd:*' recent-dirs-max 10000
    zstyle ':chpwd:*' recent-dirs-default yes
    zstyle ':completion:*' recent-dirs-insert both
fi
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

# 単語区切り設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|"'\'
zstyle ':zle:*' word-style unspecified

# コマンド自動修正
setopt correct

# 補完リストを詰める
setopt list_packed

# ビープ音抑止
setopt no_beep
setopt nolistbeep

# bash風リダイレクト
setopt no_multios

# 拡張グロブ
setopt extended_glob

# カーソル下に何も無い時の^Dでzshを終了しない
setopt ignore_eof

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# ^Q/^Sのフロー制御を無効にする
setopt no_flow_control

# rで最後に実行したコマンドの実行を無効化
disable r

# ユーティリティ
function alc() {
    if [ -n "$1" ]; then
        w3m -no-cookie "http://eow.alc.co.jp/search?q=${1}" | sed '1,60d' | ${PAGER}
    else
        echo 'usage: alc word'
    fi
}

function corpus() {
    if [ -n "$1" ]; then
        w3m -no-cookie "http://suin.asia/xoops/modules/lingua/?keyword=${1}&search=%E6%A4%9C%E7%B4%A2&source=en&targets[en]=1&targets[ja]=1" | sed '1,14d' | sed -e '/Submenu/,$d' | ${PAGER}
    else
        echo 'usage: corpus word'
    fi
}

function codic() {
    if [ -n "$1" ]; then
        w3m -no-cookie "http://codic.jp/entries/${1}" | sed '1,16d' | ${PAGER}
    else
        echo 'usage: codic word'
    fi
}

function python_server() {
    local port="5000"
    if [ -n "$1" ]; then
        port="${1}"
    fi

    if type python > /dev/null; then
        if python -V 2>&1 | grep -qm1 'Python 3\.'; then
            python -m http.server ${port}
        else
            python -m SimpleHTTPServer ${port}
        fi
    fi
}

function 256colortest() {
    local code
    for code in {0..255}; do
        echo -e "\e[38;05;${code}m $code: Test"
    done
}

function zman() {
    PAGER="less -g -s '+/^ {7}"$1"'" man zshall
}

# プロセスの実行時間が指定秒以上だった時にレポート表示
REPORTTIME=3

# エイリアス
if [ -e ~/.alias.sh ]; then
    source ~/.alias.sh
fi
