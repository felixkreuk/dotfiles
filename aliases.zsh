###############
#   ALIASES   #
###############
alias vim=nvim
alias v=nvim
alias top='htop'
alias g='git'
alias cp='rsync --info=progress2'

alias w='cd ~/workspace'
alias t='cd ~/tmp'
alias dot='cd ~/.dotfiles'
alias dot_update='cd ~/.dotfiles; ./dot_backup.sh'

alias gcap='git cap'
alias gca='git commit -a -m'
alias gs='git status'
alias gpl='git pull'
alias gl='git log --stat | bat'
alias gpom='git push origin master'
alias gdiff='git difftool'
alias tailf='tail -f'

alias dd='cd ~/.dotfiles; gca "update"; gpom; cd; source ~/.zshrc'
alias rr='source ~/.zshrc'

alias gpu='python ~/workspace/code/gpu.py'
alias pgrep='ps aux | grep'

alias tmux='tmux -2'
alias tt='tmux -2 a'

alias clean_ts='for GPU in 0 1 2 3; do TS_SOCKET=/tmp/felix_gpu_$GPU ts -C; done'
alias tss='for GPU in 0 1 2 3; do TS_SOCKET=/tmp/felix_gpu_$GPU ts; done'

kill_ts () {
	for GPU in 0 1 2 3
	do
		echo "gpu $GPU"
		pids=($(TS_SOCKET=/tmp/felix_gpu_$GPU ts | grep $1 | cut -d' ' -f1))
		for pid in $pids
		do
			if [[ "$2" = "test" ]]
			then
				echo "TS_SOCKET=/tmp/felix_gpu_$GPU ts -r $pid"
			else
				TS_SOCKET=/tmp/felix_gpu_$GPU ts -r $pid
			fi
		done
	done
}


function tsl() { 
	echo "running:  $(tss | grep running | tr -s " " | cut -c 1-10 | wc -l)" 
	echo "queued:   $(tss | grep queued | tr -s " " | cut -c 1-10 | wc -l)" 
	echo "finished: $(tss | grep finished | tr -s " " | cut -c 1-10 | wc -l)" 
}

cluster () {
	for HOST in "naboo" "jakku" "tatooine" "mustafar" "yoda" "yavin" "lobot" "moraband"
	do
		ssh $HOST "~/anaconda3/bin/gpustat"
	done
}

function tunnel() {
    echo Tunneling from localhost:$1 to $3:$2;
    ssh -N -f -L localhost:"$1":localhost:"$2" "$3"
}

function ch() {
    curl cht.sh/$1
}
