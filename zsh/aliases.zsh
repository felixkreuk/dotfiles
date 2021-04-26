alias vim=nvim
alias v=nvim
alias - -=nvim
alias top='htop'
alias g='git'

alias dd='CWD=$(pwd); cd ~/.dotfiles; gca "update"; gp origin master; cd; source ~/.zshrc; cd $CWD'
alias rr='source ~/.zshrc'
alias tailf='tail -f'
alias pgrep='ps aux | grep'

alias tmux='tmux -2'
alias ta='tmux -2 attach'
alias tksr='tmux kill-server'
alias tkse='tmux kill-session'

alias gc='git commit -m'
alias gca='git add . && git commit -m'
alias gs='git status'
alias gl='git log --stat | bat'
alias gpl='git pull'
alias gp='git push'
alias gd='git difftool'
alias gck='git checkout'
alias lg='lazygit'

alias http='ngrok http file://$(pwd)'  # run grok http file server here
alias cluster='python ~/.dotfiles/scripts/gpu.py'

function tunnel() {
    echo Tunneling from localhost:$1 to $3:$2;
    autossh -M 20000 -N -f -L localhost:$1:localhost:$2 $3
}

function ch() {
    curl cht.sh/$1
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

function md() {
  mkdir $1 && cd $1
}
