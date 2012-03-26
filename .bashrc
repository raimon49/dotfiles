## .bashrc

# zsh
for zsh_command in ~/local/bin/zsh /usr/local/bin/zsh /usr/bin/zsh /bin/zsh; do
    if [ -x ${zsh_command} ]; then
        SHELL=${zsh_command}
        exec ${zsh_command} -l
        return
        :
    fi
done

# PATH
if [ -e ~/.path.sh ]; then
    source ~/.path.sh
fi

# ENV
if [ -e ~/.env.sh ]; then
    source ~/.env.sh
fi

# 履歴
HISTFILE=~/.bash_history
HISTSIZE=50000
HISTFILESIZE=50000
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

# 補完
for bash_completion_path in "~/local/bin/bash_completion" "/etc/bash_completion"; do
    if [ -e ${bash_completion_path} ]; then
        export BASH_COMPLETION=${bash_completion_path}
        source ${BASH_COMPLETION}
        break
    fi
done

# プロンプト
readonly               ESC="$(echo -ne '\033')"
readonly             BLACK="${ESC}[30m"
readonly               RED="${ESC}[31m"
readonly             GREEN="${ESC}[32m"
readonly            YELLOW="${ESC}[33m"
readonly              BLUE="${ESC}[34m"
readonly              CYAN="${ESC}[35m"
readonly           MAGENTA="${ESC}[36m"
readonly             WHITE="${ESC}[37m"
readonly   HIGHLIGHT_BLACK="${ESC}[30;1m"
readonly     HIGHLIGHT_RED="${ESC}[31;1m"
readonly   HIGHLIGHT_GREEN="${ESC}[32;1m"
readonly  HIGHLIGHT_YELLOW="${ESC}[33;1m"
readonly    HIGHLIGHT_BLUE="${ESC}[34;1m"
readonly    HIGHLIGHT_CYAN="${ESC}[35;1m"
readonly HIGHLIGHT_MAGENTA="${ESC}[36;1m"
readonly   HIGHLIGHT_WHITE="${ESC}[37;1m"
readonly       RESET_COLOR="\[\e[0m\]"

hg_branch() {
    hg branch 2> /dev/null | awk '{print "(hg:" $1 ")"}'
}

git_branch() {
    __git_ps1 '(git:%s)'
}


VCS_PROMPT="${CYAN}\$(git_branch)\$(hg_branch)${RESET_COLOR}"
PS1="${GREEN}[\u@\H]${RESET_COLOR}${VCS_PROMPT} ${YELLOW}\w${RESET_COLOR}\n$ "

# エイリアス
if [ -e ~/.alias.sh ]; then
    source ~/.alias.sh
fi
