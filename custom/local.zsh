alias yog="wine ~/Sqlyog/SQLyog\ Community/SQLyogCommunity.exe"

export PATH=~/npm-global/bin:$PATH

#Commit something to git for WEBBUG with a comment
gcj(){
	id=$1
	comment=$2
	git commit -m "WEBBUG-${id} #comment ${comment}"
}

vboot(){
	cd ~/boxes/vagrantshell
	vagrant up
	rr vagrant "linus -S restart"
	vcache stop
	cd -
}

pulldotfiles(){
	cd ~/.dotfiles
	git checkout master-dane && git pull && git checkout master && git merge master-dane && git push
}

vcache(){
	case $1 in
		start)
			ssh -qtt vagrant "sudo /etc/init.d/varnish start"
			;;
		stop)
			ssh -qtt vagrant "sudo /etc/init.d/varnish stop"
			;;
		restart)
			ssh -qtt vagrant "sudo /etc/init.d/varnish restart"
			;;
		*)
			echo "$1 is not a valid command."
			;;
	esac
}

shownames(){
	git show $1 --name-only
}

##
#Automate some things for coming in in the morning
goodmorning() {
	corgi
	echo "Good morning, today is `date`"
	pulldotfiles
	brew update
	brew outdated
	brew upgrade
	sudo npm install -g npm@latest
}

startredis() {
	redis-server /usr/local/etc/redis.conf
}

cdpath=(~ /redpower /redpower/vendor /redpower/vendor/linusshops)

if [[ -f $HOME/.pigrc ]]; then
	source ~/.pigrc
fi

. ~/z.sh

