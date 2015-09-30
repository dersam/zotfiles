remux () {
	tmux kill-session -t devenv
	tmuxinator start devenv
}