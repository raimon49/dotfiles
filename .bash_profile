## .bash_profile

# launch zsh if it is installed
for zsh_command in ~/local/bin/zsh ~/.linuxbrew/bin/zsh /usr/local/bin/zsh /usr/bin/zsh /bin/zsh; do
    if [ -x "${zsh_command}" ]; then
        if [ -n "${PS1}" ]; then
            if [ "${FORCE_BASH}" = "1" ]; then
                unset FORCE_BASH
                source ~/.bashrc
                return
            fi
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
