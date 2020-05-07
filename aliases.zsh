alias vim=nvim
alias v=nvim
alias -- -=nvim
alias top='htop'
alias g='git'

alias dd='cd ~/.dotfiles; gca "update"; gpom; cd; source ~/.zshrc'
alias rr='source ~/.zshrc'
alias tailf='tail -f'
alias pgrep='ps aux | grep'
alias tmux='tmux -2'

alias gcap='git cap'
alias gca='git commit -a -m'
alias gs='git status'
alias gpl='git pull'
alias gl='git log --stat | bat'
alias gpom='git push origin master'
alias gdiff='git difftool'

cluster () {
	for HOST in "naboo" "jakku" "tatooine" "mustafar" "yoda" "yavin" "lobot" "moraband" "fondor" "jabba"
	do
		ssh $HOST "free=\"\$(~/anaconda3/bin/gpustat | awk '\$8 > 0' | wc -l)\"; ngpus=\"\$(nvidia-smi -L | wc -l)\"; echo \"\$(hostname) [\$free/\$ngpus]\""
	done
}

dsi_cluster () {
	for HOST in "dsi01" "dsi02" "dsi03" "dsi04" "dsi05" "dsi06" "dsi07"
	do
		echo $HOST
		ssh $HOST "nvidia-smi"
		echo "======================"
	done
}

function tunnel() {
    echo Tunneling from localhost:$1 to $3:$2;
    ssh -N -f -L localhost:"$1":localhost:"$2" "$3"
}

function ch() {
    curl cht.sh/$1
}

function watch { 
    while :; do clear; date; echo; "${@:2}"; sleep $1; done
}
