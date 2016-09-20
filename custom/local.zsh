export PATH=/usr/local/sbin:~/npm-global/bin:$PATH
export EDITOR="vim"
export DISABLE_AUTO_TITLE=true

#Commit something to git for WEBBUG with a comment
gcj(){
	id=$1
	comment=$2
	git commit -m "WEBBUG-${id} #comment ${comment}"
}

shownames(){
	git show $1 --name-only
}

startredis() {
	redis-server /usr/local/etc/redis.conf
}

re() {
	tmux attach devenv
}

if [[ -f $HOME/.pigrc ]]; then
	source ~/.pigrc
fi
