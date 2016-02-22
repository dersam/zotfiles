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

_shmux_completion () {
	local -a options
	options=('attach:attach to devenv session', 'restart:restart devenv from tmuxinator')
	_describe 'values' options
}

compdef _shmux_completion shmux
