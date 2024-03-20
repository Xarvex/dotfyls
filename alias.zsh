if (( ${+commands[bat]} )); then
    alias cat=bat
fi

if (( ${+commands[fastfetch]} )); then
    alias neofetch=fastfetch
    alias fetch=fastfetch
fi

if (( ${+commands[ls]} )); then
    alias ls='ls --color=auto'
    alias ll='ls -lA --color=auto'
fi

if (( ${+commands[nvim]} )); then
    alias vim=nvim

    nvim() {
        ${commands[nvim]} ${1:-${PWD}} ${@:2}
    }
fi

if (( ${+commands[thefuck]} )); then
    eval "$(thefuck --alias)"
fi

if (( ${+commands[zoxide]} )); then
    eval "$(zoxide init "$(basename ${SHELL})" --cmd cd)"
fi
