alias vim=nvim
alias v=nvim
alias - -=nvim
alias top='htop'
alias g='git'

alias dd='CWD=$(pwd); cd ~/.dotfiles; gc "update"; gp origin master; cd; source ~/.zshrc; cd $CWD'
alias rr='source ~/.zshrc'
alias tailf='tail -f'
alias pgrep='ps aux | grep'
alias tmux='tmux -2'

alias gc='git commit -a -m'
alias gs='git status'
alias gl='git log --stat | bat'
alias gpl='git pull'
alias gp='git push'
alias gd='git difftool'

cluster_fetch () {
	for HOST in "naboo" "jakku" "tatooine" "mustafar" "yoda" "yavin" "lobot" "moraband" "fondor" "jabba"
	do
		ssh $HOST "user=\"\$(~/anaconda3/bin/gpustat | awk 'FNR > 1 && \$NF != \"|\"' | awk 'NR==1{printf \$NF}')\"; \
		           free=\"\$(~/anaconda3/bin/gpustat | awk 'FNR > 1 && \$NF != \"|\"' | wc -l)\"; \
				   ngpus=\"\$(nvidia-smi -L | wc -l)\"; \
				   echo \"\$(hostname)\t[\$free/\$ngpus]\t\$user\""
	done
}

cluster() {
	echo "fetching..."
	echo "NODE ACTIVE USER\n $(cluster_fetch)" | column -t -o "   " | grep --color=always -E "^|.*$(whoami).*"
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
    while :; do output="$(${@:2})"; clear; date; echo; echo $output; sleep $1; done
}
