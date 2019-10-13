
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
alias gs='git status'
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
