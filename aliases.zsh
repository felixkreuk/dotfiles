if [ "$(uname)" == "Darwin" ]; then
    echo "==> runniong on mac"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    alias nvim=$HOME/installations/nvim.appimage
fi

alias vim=nvim
alias v=nvim
