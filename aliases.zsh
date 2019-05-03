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

alias ll="ls -l -X --group-directories-first --color=auto"
alias l="ls -l -X --group-directories-first --color=auto"
alias ls="ls -X --group-directories-first --color=auto"
alias vim=nvim
alias v=nvim
alias top='htop'
alias g='git'
alias cp='rsync -ah --progress'

alias w='cd ~/workspace'
alias t='cd ~/tmp'
alias dot='cd ~/.dotfiles'
alias gcap='git cap'
alias gs='git s'
alias gpl='git pull'

alias dd='cd ~/.dotfiles && gcap "update" && cd && source ~/.zshrc'
alias rr='source ~/.zshrc'

alias ack='~/installations/ack'

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
