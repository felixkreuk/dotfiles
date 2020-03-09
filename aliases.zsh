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

# clean finished
alias tsc='for GPU in 0 1 2 3; do TS_SOCKET=/tmp/felix_gpu_$GPU ts -C; done'
# display all queues
alias tss='for GPU in 0 1 2 3; do TS_SOCKET=/tmp/felix_gpu_$GPU ts; done'
# display all running/ququed/finished
alias tsr='for GPU in 0 1 2 3; do echo "gpu $GPU"; TS_SOCKET=/tmp/felix_gpu_$GPU ts | grep running; done'
alias tsq='for GPU in 0 1 2 3; do echo "gpu $GPU"; TS_SOCKET=/tmp/felix_gpu_$GPU ts | grep queued; done'
alias tsf='for GPU in 0 1 2 3; do echo "gpu $GPU"; TS_SOCKET=/tmp/felix_gpu_$GPU ts | grep finished; done'
# display queue by number
alias ts0='TS_SOCKET=/tmp/felix_gpu_0 ts'
alias ts1='TS_SOCKET=/tmp/felix_gpu_1 ts'
alias ts2='TS_SOCKET=/tmp/felix_gpu_2 ts'
alias ts3='TS_SOCKET=/tmp/felix_gpu_3 ts'

###############
#  FUNCTIONS  #
###############

function kill_ts() { 
	for GPU in 0 1 2 3
	do
		pids=($(TS_SOCKET=/tmp/felix_gpu_$GPU ts | grep $1 | cut -d' ' -f1))
		for pid in $pids
		do
			if [[ "$2" == "test" ]]; then
				echo "TS_SOCKET=/tmp/felix_gpu_$GPU ts -r $pid"
			else
				TS_SOCKET=/tmp/felix_gpu_$GPU ts -r $pid
			fi
		done
	done
}

cluster () {
	for HOST in "naboo" "jakku" "tatooine" "mustafar" "yoda" "yavin" "lobot" "moraband" "fondor" "jabba"
	do
		ssh $HOST "~/anaconda3/bin/gpustat"
		echo "\n"
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
