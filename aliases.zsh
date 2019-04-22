case `uname` in
  Darwin)
    # commands for OS X go here
    PATH=$HOME/anaconda3/bin:$PATH
  ;;
  Linux)
    # commands for Linux go here
    alias nvim=$HOME/installations/nvim.appimage
    PATH=$HOME/anaconda3/bin:$PATH
    export LANG=en_US.utf8
    export LC_ALL=en_US.utf8
  ;;
esac

###############
#   ALIASES   #
###############

alias ls='ls -X --group-directories-first'
alias l='l -X --group-directories-first'
alias ll='ll -X --group-directories-first'
alias vim=nvim
alias v=nvim
alias cp='rsync -ah --progress'
alias w='cd ~/workspace'
alias t='cd ~/tmp'
alias top='htop'
alias g='git'
alias gcap='git cap'
alias gs='git s'

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
