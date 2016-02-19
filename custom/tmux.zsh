devshell-restart () {
	tmux kill-session -t devenv
	tmuxinator start devenv
}

devshell-attach () {
	tmux detach-client -s devenv
	tmux a
}