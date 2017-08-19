echo "Updating dot files..."
cp ~/.ssh/config ~/Workspace/dotfiles/
cp ~/.zshrc ~/Workspace/dotfiles/.zshrc
cp ~/.zsh_config ~/Workspace/dotfiles/.zsh_config
cp ~/.khdrc ~/Workspace/dotfiles/.khdrc
cp ~/.chunkwmrc ~/Workspace/dotfiles/.chunkwmrc
cd ~/Workspace/dotfiles
git add .
git commit -m "update"
git push origin master
echo "Done."