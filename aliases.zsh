case `uname` in
  Darwin)
    # commands for OS X go here
    PATH=$HOME/anaconda3/bin:$PATH
  ;;
  Linux)
    # commands for Linux go here
    alias nvim=$HOME/installations/nvim.appimage
    PATH=$HOME/anaconda3/bin:$PATH
  ;;
esac

alias vim=nvim
alias v=nvim
alias cp='rsync -ah --progress'

# location shortcuts
alias w='cd ~/workspace'
alias t='cd ~/tmp'
