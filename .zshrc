export PATH="/usr/local/sbin:$PATH"
source ~/.zsh_config
source ~/.aliases
source ~/.functions

export PATH="/Users/felix/Applications/Anaconda/anaconda/bin:$PATH"

# --- added by torch installer ---
. /Users/felix/torch/install/bin/torch-activate

# --- added by fzf fuzzy search ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
