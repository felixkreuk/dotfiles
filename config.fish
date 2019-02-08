set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx PATH /Users/felixkreuk/anaconda3/bin $PATH

# --- mv, rm, cp ---
alias mv='mv -v'
alias rm='rm -v'
alias cp='cp -v'

# --- CUSTOM PLACES ---
alias w='cd ~/Workspace'
alias wc='cd ~/Workspace/code'
alias wpa='cd ~/Workspace/papers'
alias wpr='cd ~/Workspace/presentations'
alias wd='cd ~/Workspace/datasets'
alias d='cd ~/Downloads'
alias t='cd ~/Tmp'

# --- PROGRAMS ---
alias vim='nvim'
alias v='nvim'
alias a='/Applications/Atom.app/Contents/Resources/app/atom.sh'
alias g='git'

# --- GIT ---
alias gps='g ps'
alias gpl='g pl'
alias gd='g d'
alias gdd='g dd'
alias gl='g l'
alias gs='g s'
alias gca='g ca'
alias gcap='g cap'
alias gcl='g c'

# --- FILES ---
alias rr='source ~/.zshrc'
alias zshrc='vim ~/.zshrc'

# --- SHORTCUTS ---
alias c='clear'
alias h='history'
alias lsa='ls -a'
alias sizes="du -sh * | sort -n"
alias top="htop"
alias dot="~/Workspace/code/dotfiles/dot_backup.sh" # update dotfiles repo
alias jn='jupyter lab'
alias gpu='python ~/Workspace/code/gpu.py'

# tunnel ssh 1-local port 2-remote host 3-remote port
function tunnel
    echo Tunneling from localhost:$1 to $3:$2;
    ssh -N -f -L localhost:"$1":localhost:"$2" "$3"
end
