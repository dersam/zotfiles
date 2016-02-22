shmux () {
	case $1 in
		r)
			;&
		restart)
			tmux kill-session -t devenv
			tmuxinator start devenv
			;;
		a)
			;&
		attach)
			tmux detach-client -s devenv
			tmux a
			;;
		*)
			echo "Unrecognized command " $1
	esac
}
