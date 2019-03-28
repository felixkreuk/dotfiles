# clone my dot files and copy to relevant spots
echo "==> downloading dotfiles"
cd $HOME
git clone https://github.com/felixkreuk/dotfiles.git .dotfiles
cd .dotfiles

echo "==> symlinking"
if [ ! -d "$HOME/.config" ]; then
    echo "==> creating ~/.config"
    mkdir -p "$HOME/.config"
fi
ln -s $HOME/.dotfiles/.config/nvim ~/.config/nvim
ln -s $HOME/.dotfiles/.config/nvim/init.vim ~/.vimrc
ln -s $HOME/.dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -s $HOME/.dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf

echo "==> intsalling neovim python support"
pip2 install --user neovim
pip3 install --user neovim

echo "==> installing zplug"
$ZPLUG_HOME=$HOME/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

echo "==> installing vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
