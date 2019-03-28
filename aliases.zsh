if [ "$(uname)" == "Darwin" ]; then
    # RUNNING ON MAC
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    alias nvim=$HOME/installations/nvim.appimage
fi

alias vim=nvim
alias v=nvim
