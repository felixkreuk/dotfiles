export PATH="/usr/local/sbin:$PATH"
source ~/.zsh_config

# ----------------------------
# MAKE BASH BETTER
# ----------------------------

# --- CUSTOM PLACES ---
alias master='cd ~/Google\ Drive/Studies/Master/'
alias work='cd ~/Workspace'
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias tmp='cd ~/Tmp'

# --- PROGRAMS ---
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias sub='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias texstudio='/Applications/texstudio.app/Contents/MacOS/texstudio'

# --- SSH ---
alias serv='ssh felix@10.0.0.10'
alias u2='ssh krukfel@u2.cs.biu.ac.il'
alias 89511='ssh 89-511@u2.cs.biu.ac.il'
alias 89210='ssh 89-210@u2.cs.biu.ac.il'
alias jekyll='ssh jkeshet@jekyll.cs.biu.ac.il'

# --- FILES ---
alias rr='source ~/.zshrc'
alias zshrc='sub ~/.zshrc'
alias vimrc='sub ~/.vimrc'

# --- SHORTCUTS ---
alias c='clear'
alias h='history'
alias hs='history | grep $1'
alias tgz='tar -xzvf'
# recursive ls
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
# open currect folder in finder
alias f='open -a Finder ./'

# --- FUNCTIONS ---
# quick git push
function qpush() {
    git add .
    git commit -m "$1"
    git push origin master
}
# update dotfiles repo
alias dot='cp ~/.ssh/config ~/Workspace/dotfiles/ && cp ~/.zshrc ~/Workspace/dotfiles/.zshrc && cp ~/.zsh_config ~/Workspace/dotfiles/.zsh_config && cp ~/.vimrc ~/Workspace/dotfiles/.vimrc && cp ~/.tmux.conf ~/Workspace/dotfiles/.tmux.conf && cd ~/Workspace/dotfiles && git add . && git commit -m "update" && git push origin master'
# always ls after cd
cd() { builtin cd "$@"; ll;  }
# Extract based upon file ext
function ex() {
     if [ -f "$1" ] ; then
         case "$1" in
             *.tar.bz2)   tar xvjf "$1"        ;;
             *.tar.gz)    tar xvzf "$1"     ;;
             *.bz2)       bunzip2 "$1"       ;;
             *.rar)       unrar x "$1"     ;;
             *.gz)        gunzip "$1"     ;;
             *.tar)       tar xvf "$1"        ;;
             *.tbz2)      tar xvjf "$1"      ;;
             *.tgz)       tar xvzf "$1"       ;;
             *.jar)       jar xf "$1"       ;;
             *.zip)       unzip "$1"     ;;
             *.Z)         uncompress "$1"  ;;
             *.7z)        7z x "$1"    ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# --- added by anaconda2 4.2.0 installer ---
export PATH="/Users/felix/Applications/Anaconda/anaconda/bin:$PATH" 
