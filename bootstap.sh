#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync
    --exclude ".git/" \
		--exclude "bootstrap.sh" \
    --exclude ".gitignore" \
    --exclude "brew_apps.txt" \
    --exclude "config" \
    --exclude "dot_backup.sh" \
		-avh --no-perms . ~;
  cp ./config ~/.ssh/config
	source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
