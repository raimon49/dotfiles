## .zshrc

# 環境変数
export LANG=ja_JP.UTF-8 
export EDITOR=vim
export SVN_EDITOR=vim
export PAGER=lv
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# 補完リストの色付け
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

# emacsキーバインド
bindkey -e

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# 補完
autoload -U compinit
compinit

# プロンプト
autoload colors
colors
VCS_PROMPT=""
if [[ $ZSH_VERSION == (<5->|4.<4->|4.3.<7->)* ]]; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' formats ':(%s)%b'
    zstyle ':vcs_info:*' actionformats ':(%s)%b|%a'
    precmd () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    VCS_PROMPT="%1(v|%F{green}%1v%f|)"
fi
PROMPT="%{${fg[green]}%}[%n@%m]${VCS_PROMPT} %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
unset VCS_PROMPT

# ディレクトリ移動
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# コマンド自動修正
setopt correct

# 補完リストを詰める
setopt list_packed

# ビープ音抑止
setopt nolistbeep

# bash風リダイレクト
setopt no_multios

# エイリアス
case "${OSTYPE}" in
    freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
    linux*)
    alias ls="ls --color=auto"
    ;;
esac
alias l="ls -CF"
alias ll="ls -laF"
