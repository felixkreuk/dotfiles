echo "Updating dot files..."
cd ~/Workspace/dotfiles
git add .
git commit -m "update"
git push origin master
echo "Done."
