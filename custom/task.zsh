tn () {
	task $1 modify +next
}

td () {
	task $1 done
}

ta () {
	task add $@
}

ts () {
	task $1 start
}

th () {
	task $1 stop
}

tdep () {
	task $1 modify depends:$2
}

ams () {
	task sync
}

tcon () {
	task config $@
}

tasklist () {
	while true
	do
		clear
		task $@
		sleep 1
	done
}

taskmux () {
	tmux kill-session -t tasklist
	tmuxinator start tasklist
}
