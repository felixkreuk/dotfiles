# clone my dot files and copy to relevant spots
echo "==> downloading dotfiles"
cd $HOME
git clone https://github.com/felixkreuk/dotfiles.git .dotfiles
cd .dotfiles

echo "==> configuring zsh"
ZSH_CUSTOM=~/.oh-my-zsh/custom
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"
# install zsh auto suggest
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# instsall syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s "$(command -v zsh)"

echo "==> symlinking"
if [ ! -d "$HOME/.config" ]; then
    echo "==> creating ~/.config"
    mkdir -p "$HOME/.config"
fi
ln -s $HOME/.dotfiles/.config/nvim ~/.config/nvim
ln -s $HOME/.dotfiles/.config/nvim/init.vim ~/.vimrc
rm $HOME/.zshrc && ln -s $HOME/.dotfiles/zshrc.symlink ~/.zshrc
ln -s $HOME/.dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf

echo "==> intsalling neovim python support"
pip2 install --user neovim
pip3 install --user neovim

echo "==> installing vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
