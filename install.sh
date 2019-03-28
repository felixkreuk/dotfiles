# clone my dot files and copy to relevant spots
echo "==> downloading dotfiles"
cd ~; mkdir installations; cd installations
git clone https://github.com/felixkreuk/dotfiles.git
cd dotfiles

echo "==> symlinking"
if [ ! -d "$HOME/.config" ]; then
    echo "==> creating ~/.config"
    mkdir -p "$HOME/.config"
fi
ln -s `pwd`/.config/nvim ~/.config/nvim
ln -s `pwd`/.config/nvim/init.vim ~/.vimrc
ln -s `pwd`/zsh/zshrc.symlink ~/.zshrc
ln -s `pwd`/tmux/tmux.conf.symlink ~/.tmux.conf

echo "==> intsalling neovim python support"
pip2 install --user neovim
pip3 install --user neovim

echo "==> installing vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
