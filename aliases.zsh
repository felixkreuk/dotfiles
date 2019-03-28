case `uname` in
  Darwin)
    # commands for OS X go here
    echo "==> runniong on mac"
  ;;
  Linux)
    # commands for Linux go here
    alias nvim=$HOME/installations/nvim.appimage
    PATH=$HOME/anaconda3/bin:$PATH
  ;;
esac

alias vim=nvim
alias v=nvim
