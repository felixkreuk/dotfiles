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
alias emacs='/usr/local/Cellar/emacs/25.2/bin/emacs'
alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'

# --- SSH ---
alias u2='ssh krukfel@u2'
alias jekyll='ssh jkeshet@jekyll'
alias hyde='ssh jkeshet@hyde'
alias tjekyll='tunnel 4444 22 jekyll'
alias thyde='tunnel 5555 22 hyde'

# --- FILES ---
alias rr='source ~/.zshrc'
alias zshrc='atom ~/.zshrc'

# --- SHORTCUTS ---
alias c='clear'
alias h='history'
alias hs='history | grep $1'
alias tgz='tar -xzvf'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less' # recursive ls
alias f='open -a Finder ./' # open currect folder in finder
alias sizes="du -sh * | sort -n"
alias top="htop"
alias dot="~/Workspace/dotfiles/dot_backup.sh" # update dotfiles repo
alias kwmrr="brew services stop chunkwm && brew services start chunkwm"
alias khdrr="brew services stop khd && brew services start khd"

# --- FUNCTIONS ---
# quick git push
function qpush() {
    git add .
    git commit -m "$1"
    git push origin master
}
function tunnel() {
    echo Tunneling from localhost:$1 to $3:$2;
    ssh -N -f -L localhost:"$1":localhost:"$2" "$3"
    }
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

# --- added by torch installer ---
. /Users/felix/torch/install/bin/torch-activate

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
