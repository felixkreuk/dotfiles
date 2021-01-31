brew update
brew upgrade

brew tap caskroom/cask

brew install neovim
brew install fzf && $(brew --prefix)/opt/fzf/install
brew install htop
brew install pandoc
brew install tmux
brew install zsh

brew cask install slack
brew cask install whatsapp
brew cask install praat
brew cask install atext
brew cask install notion
brew cask install alfred
brew cask install rectangle
brew cask install transmission
brew cask install keyboardcleantool
brew cask install iterm2
brew cask install bitwarden
brew cask install google-backup-and-sync
brew cask install spotify
brew cask install iina
brew cask install visual-studio-code
brew cask install marta
brew cask install hazel
brew cask install bettertouchtool
brew cask install jupyter-notebook-viewer
brew cask install ngrok
brew install --cask numi

brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew install jesseduffield/lazygit/lazygit
brew install git-delta

brew cleanup

echo "Dont forget to install:"
echo "dropover"

