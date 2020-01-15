case `uname` in
  Darwin)
    if [ $(hostname) = "Felixs-MacBook-Pro.local" ]; then
      echo "==> on lab mac"
    elif [ $(hostname) = "iBeast" ]; then 
      echo "==> on home mac"
    else
      echo "==> unknown mac"
    fi
  ;;
  Linux)
    if [ $(hostname) = "felix-linux" ]; then
      echo "==> on home linux machine"
    elif [ $(hostname) = "fkreuk-linux" ]; then
      echo "==> on nv local machine"
    else
      echo "==> on lab cluster machine"
      alias nvim=$HOME/installations/nvim.appimage
      alias bat=$HOME/installations/bat/bat
      alias vifm=$HOME/installations/vifm/bin/vifm
      alias ts=$HOME/installations/ts/ts
      alias ack='~/installations/ack'
      PATH=$HOME/anaconda3/bin:$PATH
      export EDITOR=$HOME/installations/nvim.appimage
      export GIT_EDITOR=$HOME/installations/nvim.appimage
    fi
  ;;
esac

export LANG=en_US.utf8
export LC_ALL=en_US.utf8
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/local/bin:$PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"

ZSH_THEME="ys"
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
base16_onedark

plugins=(
    zsh-autosuggestions
    git
    zsh-syntax-highlighting
    tmux
    web-search
)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/aliases.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# jupyter tunnel
autossh -M 20000 -N -f -L localhost:8888:localhost:8888 felixk@yavin
# tensorboard tunnel
autossh -M 20000 -N -f -L localhost:6006:localhost:6006 felixk@yavin
