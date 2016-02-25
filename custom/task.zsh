tn () {
	task $1 modify +next
	task sync
}

td () {
	task $1 done
	task sync
}

ta () {
	task add $@
	task sync
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
