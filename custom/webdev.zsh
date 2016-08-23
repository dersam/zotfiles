
hash foo 2>/dev/null && eval "$(gulp --completion=zsh)"

msim () {
	if [[ $1 == 'ios' ]]; then
		open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
	fi
}

alias phpdebug='PHP_IDE_CONFIG="serverName=develop.vagrant.dev" /usr/bin/env php -d "xdebug.idekey=PHPSTORM" -d "xdebug.remote_host=192.168.80.1" -d "xdebug.remote_port=9000" -d "xdebug.remote_enable=1" -d "xdebug.remote_autostart=1" -d "xdebug.remote_handler=dbgp"'

alias inphantom="phantomjs --webdriver=8643 --debug=true --ssl-protocol=any --ignore-ssl-errors=true"

alias rx='rr vagrant "sudo /etc/init.d/nginx restart"'

dockenv () {
	eval $(docker-machine env default)
}

alias makedocker="docker-machine create --driver=parallels --parallels-memory=4000 default && dockenv"

alias dockerup="docker-machine start default"

alias selbuild="docker run --rm --name=grid --add-host='develop.vagrant.dev:192.168.80.80' -p 4444:24444 -p 5920:25900 \
  -v /dev/shm:/dev/shm -e VNC_PASSWORD=hola elgalu/selenium:2.51.0b"

selvnc () {
	open vnc://:hola@$(docker-machine ip default):5920
}


##
# Custom completion for vshell command.
#
# The vshell command is part of the VagrantShell repo located at
# https://github.com/danemacmillan/vagrantshell
#
# Adapted from danemacmillan dotfiles
#
_vshell_completion()
{
	local -a options
	options=('help','map','restart','update','xdebug','xhprof')
	_describe 'values' options
}

compdef _vshell_completion vshell
