case `uname` in
  Darwin)
    if [ $(hostname) = "Felixs-MBP" ]; then
      echo "on lab mac"
    elif [ $(hostname) = "iBeast" ]; then 
      echo "on home mac"
    else
      echo "unknown mac"
    fi
  ;;
  Linux)
    # commands for Linux go here
    alias nvim=$HOME/installations/nvim.appimage
    alias bat=$HOME/installations/bat/bat
    alias vifm=$HOME/installations/vifm/bin/vifm
    alias ts=$HOME/installations/ts/ts
    alias ack='~/installations/ack'
    PATH=$HOME/anaconda3/bin:$PATH
    export LANG=en_US.utf8
    export LC_ALL=en_US.utf8
    export EDITOR=$HOME/installations/nvim.appimage
    export GIT_EDITOR=$HOME/installations/nvim.appimage
  ;;
esac

###############
#   ALIASES   #
###############
alias vim=nvim
alias v=nvim
alias top='htop'
alias g='git'
alias cp='rsync -ah --progress'

alias w='cd ~/workspace'
alias t='cd ~/tmp'
alias dot='cd ~/.dotfiles'
alias gcap='git cap'
alias gca='git commit -a -m'
alias gs='git s'
alias gpl='git pull'
alias gl='git log --stat | bat'
alias gpom='git push origin master'
alias gdiff='git difftool'

alias dd='cd ~/.dotfiles && gcap "update" && cd && source ~/.zshrc'
alias rr='source ~/.zshrc'

alias gpu='python ~/workspace/code/gpu.py'
alias pgrep='ps aux | grep'

alias tmux='tmux -2'
alias tt='tmux -2 a'

###############
#  FUNCTIONS  #
###############

function tunnel() {
    echo Tunneling from localhost:$1 to $3:$2;
    ssh -N -f -L localhost:"$1":localhost:"$2" "$3"
}

function ch() {
    curl cht.sh/$1
}
