cd $HOME
if [ -d .dotfiles ]; then
    rm -rf .dotfiles
fi
git clone https://github.com/felixkreuk/dotfiles.git .dotfiles
cd .dotfiles

ZSH_CUSTOM=~/.oh-my-zsh/custom
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s "$(command -v zsh)"

pip2 install --user neovim
pip3 install --user neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d "$HOME/installations" ]; then
    mkdir -p "$HOME/installations"
fi

# install ACK
curl https://beyondgrep.com/ack-2.28-single-file > ~/installations/ack && chmod 0755 ~/installations/ack

# install fzf
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
