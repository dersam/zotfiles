###########
#apps.zsh
#
# Contains customizations and shortcuts for various applications.
###########

# Git
# override with ~/extra.zsh if necessary
export DEV_BRANCH_NAME='dev'
##

retop () {
	git branch -D tophat
	git checkout -b tophat
}

# Merge all canonical branches from current directory.
choochoo()
{
	echo -e "\xf0\x9f\x9a\x82 \xf0\x9f\x9a\x83 \xf0\x9f\x9a\x83 \xf0\x9f\x9a\x83 \xf0\x9f\x9a\x83"
	git checkout $DEV_BRANCH_NAME && git pull && git checkout stage && git pull && git merge $DEV_BRANCH_NAME && git push && git checkout master && git pull && git merge stage && git push && git checkout $DEV_BRANCH_NAME && echo -e "All canonical branches merged up to master."
}

crel () {
	git checkout rel-1.$1.0
}
 
cdevelop () {
	git checkout $DEV_BRANCH_NAME
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

getdev () {
	echo -e "Merging develop into your current branch  \xe2\x9a\xa1"
	cdevelop && git pull && clast && git merge $DEV_BRANCH_NAME
}

todev () {
	echo -e "Merging current branch into develop  \xe2\x9a\xa1"
	cdevelop && git pull && git merge @{-1}
}

# Inflict changes from a feature branch upon the dev branch.
# Pull dev branch, merge it to the current branch, then merge current branch to dev and push it up
inflict () {
	cdevelop && git pull && clast && git merge $DEV_BRANCH_NAME && cdevelop && git merge @{-1} && git push && clast
}

shownames(){
	git show $1 --name-only
}

cleanremotes(){
	git fetch origin -p && git fetch composer -p
}

devdb () {
	mycli -h $DEV_DB_HOST -u $DEV_DB_USER -p $DEV_DB_PASSWORD
}

export EVENT_NOKQUEUE=1

# TMUX
shmux () {
	case $1 in
		r)
			;&
		restart)
			tmux kill-session -t $DEV_TMUX_ENV
			tmuxinator start $DEV_TMUX_ENV
			;;
		a)
			;&
		attach)
			tmux detach-client -s $DEV_TMUX_ENV
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
