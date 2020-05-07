if [ $(hostname) = "Felixs-MacBook-Pro.local" ]; then
  echo "==> on mac"
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

export LANG=en_US.utf8
export LC_ALL=en_US.utf8
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/local/bin:$PATH

ZSH_THEME="ys"
HISTSIZE=1000
SAVEHIST=1000
plugins=(
    zsh-autosuggestions
    git
    zsh-syntax-highlighting
    tmux
    web-search
)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/aliases.zsh
source $DOTFILES/ts.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh