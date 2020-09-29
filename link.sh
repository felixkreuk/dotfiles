rm $HOME/.config/nvim
ln -s $HOME/.dotfiles/.config/nvim $HOME/.config/nvim

rm $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc

rm $HOME/.tmux.conf $HOME/.tmux.conf.local
ln -s $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/tmux/.tmux.conf.local $HOME/.tmux.conf.local

#rm $HOME/.skhdrc $HOME/.yabairc
#ln -s $HOME/.dotfiles/yabai/skhdrc $HOME/.skhdrc
#ln -s $HOME/.dotfiles/yabai/yabairc $HOME/.yabairc
