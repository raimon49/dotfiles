## .zshrc

# 環境変数
export LANG=ja_JP.UTF-8 
export LC_CTYPE=ja_JP.UTF-8
export PATH="${HOME}/local/bin:${PATH}"
export EDITOR=vim
export SVN_EDITOR=vim
export SCREENDIR="${HOME}/.screen"
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
if [ `which lv 2> /dev/null` ]; then
    export PAGER=lv
elif [ `which less 2> /dev/null` ]; then
    export PAGER=less
fi

# emacsキーバインド
bindkey -e

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 
if [[ $ZSH_VERSION == (<5->|4.<4->|4.3.<9->)* ]]; then
    bindkey "^R" history-incremental-pattern-search-backward
fi

# 補完
autoload -U compinit
compinit

# 補完リストの色付け
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

# プロセスID補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# プロンプト
autoload colors
colors
VCS_PROMPT=""
if [[ $ZSH_VERSION == (<5->|4.<4->|4.3.<7->)* ]]; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' branchformat '%b:r%r'
    zstyle ':vcs_info:*' formats ':(%s)%b'
    zstyle ':vcs_info:*' actionformats ':(%s)%b|%a'
    precmd () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    VCS_PROMPT="%1(v|%F{blue}%1v%f|)"
fi
PROMPT="%{${fg[green]}%}[%n@%m]${VCS_PROMPT}%{${fg[green]}%}%(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%50<..<%~]%{${reset_color}%}"
unset VCS_PROMPT

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

# エイリアス
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
alias screen="screen -U"
alias :q="exit"
alias -g H=" | head"
alias -g T=" | tail"
alias -g L=" | ${PAGER}"
alias -g V=" | vim -R -"
