#!/bin/bash

echo "Copying local files to repo..."
HERE=~/Workspace/code/dotfiles/
cp -r ~/.tmux.conf $HERE
cp -r ~/.ssh/config $HERE/.ssh/
cp -r ~/.gitconfig $HERE
cp -r ~/.vim_runtime/my_configs.vim $HERE
cp -r ~/.config/nvim/ $HERE/.config/nvim
cp -r ~/.vim/plugged/neosnippet-snippets/neosnippets/python.snip $HERE
echo "Updating local dot files to remote..."
cd $HERE
git add .
git commit -a -m "update"
git push origin master
echo "Done."
