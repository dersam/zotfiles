tn () {
	task $1 modify +next
}

td () {
	task $1 done
}

ta () {
	task add $@
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
