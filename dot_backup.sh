echo "Copying local files to repo..."
HERE=~/Workspace/code/dotfiles/
cp ~/.zsh_config $HERE
cp ~/.functions $HERE
cp ~/.aliases $HERE
cp ~/.zshrc $HERE
cp ~/.tmux.conf $HERE
cp ~/.ssh/config $HERE
cp ~/.config/nvim/init.vim $HERE
cp ~/.gitconfig $HERE
cp ~/.gitignore $HERE
cp ~/.vim_runtime/my_configs.vim $HERE
cp ~/.config/nvim/init.vim $HERE
cp ~/.config/nvim/colors/ $HERE
echo "Updating local dot files to remote..."
cd $HERE
git add .
git commit -m "update"
git push origin master
echo "Done."
