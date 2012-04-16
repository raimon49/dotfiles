## .bashrc

# zsh
for zsh_command in ~/local/bin/zsh /usr/local/bin/zsh /usr/bin/zsh /bin/zsh; do
    if [ -x ${zsh_command} ]; then
        if [ -n "${PS1}" ]; then
            SHELL=${zsh_command}
            exec ${zsh_command} -l
            return
        fi
        :
    fi
done

# PATH
if [ -e ~/.path.sh ]; then
    source ~/.path.sh
fi

# for SSH
if [ -z "${PS1}" ]; then
    return
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
if [ -e ~/local/bin/git-completion.bash ]; then
    source ~/local/bin/git-completion.bash
    GIT_PS1_SHOWDIRTYSTATE="YES"
fi

# プロンプト
              ESC="$(echo -ne '\033')"
            BLACK="${ESC}[30m"
              RED="${ESC}[31m"
            GREEN="${ESC}[32m"
           YELLOW="${ESC}[33m"
             BLUE="${ESC}[34m"
             CYAN="${ESC}[35m"
          MAGENTA="${ESC}[36m"
            WHITE="${ESC}[37m"
  HIGHLIGHT_BLACK="${ESC}[30;1m"
    HIGHLIGHT_RED="${ESC}[31;1m"
  HIGHLIGHT_GREEN="${ESC}[32;1m"
 HIGHLIGHT_YELLOW="${ESC}[33;1m"
   HIGHLIGHT_BLUE="${ESC}[34;1m"
   HIGHLIGHT_CYAN="${ESC}[35;1m"
HIGHLIGHT_MAGENTA="${ESC}[36;1m"
  HIGHLIGHT_WHITE="${ESC}[37;1m"
      RESET_COLOR="\[\e[0m\]"

hg_branch() {
    hg branch 2> /dev/null | awk '{print "(hg:" $1 ")"}'
}

git_branch() {
    __git_ps1 '(git:%s)'
}

VCS_GIT_BR=""
if [ -n "${GIT_PS1_SHOWDIRTYSTATE}" ]; then
    VCS_GIT_BR="\$(git_branch)"
fi
VCS_HG_BR=""
if [ -x "`which hg 2> /dev/null`" ]; then
    VCS_HG_BR="\$(hg_branch)"
fi

VCS_PROMPT="${CYAN}${VCS_GIT_BR}${HG_BR}${RESET_COLOR}"
PS1="${GREEN}[\u@\H]${RESET_COLOR}${VCS_PROMPT} ${YELLOW}\w${RESET_COLOR}\n$ "

# エイリアス
if [ -e ~/.alias.sh ]; then
    source ~/.alias.sh
fi
