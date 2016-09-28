###########
#apps.zsh
#
# Contains customizations and shortcuts for various applications.
###########

# Git

##
# Merge all canonical branches from current directory.
choochoo()
{
	echo -e "\xf0\x9f\x9a\x82 \xf0\x9f\x9a\x83 \xf0\x9f\x9a\x83 \xf0\x9f\x9a\x83 \xf0\x9f\x9a\x83"
	git checkout develop && git pull && git checkout stage && git pull && git merge develop && git push && git checkout master && git pull && git merge stage && git push && git checkout develop && echo -e "All canonical branches merged up to master."
}

cdevelop () {
	git checkout develop
}

cstage () {
	git checkout stage
}

cmaster () {
	git checkout master
}

clast () {
	git checkout @{-1}
}

clastn () {
	git checkout @{-$1}
}

shownames(){
	git show $1 --name-only
}

## GitKraken
## Open GitKraken using the current repo directory.
kraken () {
	~/Applications/GitKraken.app/Contents/MacOS/GitKraken -p $(pwd)
}

#MySQL
alias mysql="mycli"
export DEV_DB_NAME="develop"

devdb () {
	mysql -h develop.vagrant.dev -u root -D $DEV_DB_NAME
}

# Taskwarrior
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

te () {
	task $1 edit
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

ct () {
	clear && task
}

export EVENT_NOKQUEUE=1

# TMUX
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
