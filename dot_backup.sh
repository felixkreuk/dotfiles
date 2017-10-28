echo "Copying local files to repo..."
HERE=~/Workspace/dotfiles/
cp ~/.zsh_config $HERE
cp ~/.aliases $HERE
cp ~/.zshrc $HERE
cp ~/.tmux.conf $HERE
cp ~/.ssh/config $HERE
cp ~/.config/nvim/init.vim $HERE
echo "Updating local dot files to remote..."
cd ~/Workspace/dotfiles
git add .
git commit -m "update"
git push origin master
echo "Done."
