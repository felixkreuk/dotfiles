#!/bin/bash

echo "Copying local files to repo..."
HERE=~/Workspace/code/dotfiles/
cp -r ~/.zsh_config $HERE
cp -r ~/.functions $HERE
cp -r ~/.aliases $HERE
cp -r ~/.zshrc $HERE
cp -r ~/.tmux.conf $HERE
cp -r ~/.ssh/config $HERE
cp -r ~/.config/nvim/init.vim $HERE
cp -r ~/.gitconfig $HERE
cp -r ~/.gitignore $HERE
cp -r ~/.vim_runtime/my_configs.vim $HERE
cp -r ~/.config/nvim/init.vim $HERE
cp -r ~/.config/nvim/colors/ $HERE
cp -r ~/.vim/plugged/neosnippet-snippets/neosnippets/python.snip $HERE
cp -r ~/.config/fish/config.fish $HERE
cp -r ~/.config/fish/fishfile $HERE
echo "Updating local dot files to remote..."
cd $HERE
git add .
git commit -m "update"
git push origin master
echo "Done."
