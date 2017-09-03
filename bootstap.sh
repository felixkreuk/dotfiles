#!/usr/bin/env bash
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude "bootstrap.sh" \
    --exclude ".gitignore" \
    --exclude "brew_apps.txt" \
    --exclude "config" \
    --exclude "dot_backup.sh" \
		-avh --no-perms . ~;
  cp ./config ~/.ssh/config;
	source ~/.zshrc;
}

doIt
unset doIt;
