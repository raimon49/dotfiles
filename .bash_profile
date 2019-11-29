## .bash_profile

# launch zsh if it is installed
for zsh_command in ~/local/bin/zsh ~/.linuxbrew/bin/zsh /usr/local/bin/zsh /usr/bin/zsh /bin/zsh; do
    if [ -x "${zsh_command}" ]; then
        if [ -n "${PS1}" ]; then
            SHELL="${zsh_command}"
            exec ${zsh_command} -l
            return
        fi
        :
    fi
done

if [ -e ~/.bashrc ]; then
    source ~/.bashrc
fi

# launch anyenv only once(NOT .bashrc)
export ANYENV_ROOT="${HOME}/.anyenv"
if [ -d "${ANYENV_ROOT}" ]; then
    export PATH="${HOME}/.anyenv/bin:${PATH}"
    eval "$(anyenv init -)"
fi
