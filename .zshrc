# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/felix/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew python tmux web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zsh-syntax-highlighting
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----------------------------
# MY ADDITIONS
# ----------------------------

# --- CUSTOM PLACES ---
alias master='cd ~/Google\ Drive/Studies/Master/'
alias work='cd ~/Workspace'
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias tmp='cd ~/Tmp'

# --- SSH ---
alias serv='ssh felix@10.0.0.10'
alias u2='ssh krukfel@u2.cs.biu.ac.il'
alias 89511='ssh 89-511@u2.cs.biu.ac.il'
alias 89210='ssh 89-210@u2.cs.biu.ac.il'
alias jekyll='ssh yoda@jekyll.cs.biu.ac.il'
alias jekyllu2='ssh -t krukfel@u2.cs.biu.ac.il ssh yoda@jekyll.cs.biu.ac.il'

# --- FILES ---
alias rr='source ~/.zshrc'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

# --- PROGRAMS ---
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias sub='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias texstudio='/Applications/texstudio.app/Contents/MacOS/texstudio'

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
alias gpush='git add . && git commit -m "$1" && git push origin master'
alias dot='cp ~/.zshrc ~/Workspace/dotfiles/.zshrc && cp ~/.vimrc ~/Workspace/dotfiles/.vimrc && cp ~/.tmux.conf ~/Workspace/dotfiles/.tmux.conf && cd ~/Workspace/dotfiles && git add . && git commit -m "update" && git push origin master'
cd() { builtin cd "$@"; ll;  } # always ls after cd

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

# --- added by naconda2 4.2.0 installer ---
export PATH="/Users/felix/Applications/Anaconda/anaconda/bin:$PATH" 
