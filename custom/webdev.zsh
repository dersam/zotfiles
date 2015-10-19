
hash foo 2>/dev/null && eval "$(gulp --completion=zsh)"

msim () {
	if [[ $1 == 'ios' ]]; then
		open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
	fi
}

alias phpdebug='PHP_IDE_CONFIG="serverName=develop.vagrant.dev" /usr/bin/env php -d "xdebug.idekey=PHPSTORM" -d "xdebug.remote_host=10.0.2.2" -d "xdebug.remote_port=9000" -d "xdebug.remote_enable=1" -d "xdebug.remote_autostart=1" -d "xdebug.remote_handler=dbgp"'

alias inphantom="phantomjs --webdriver=8643 --debug=true --ssl-protocol=any --ignore-ssl-errors=true"

alias rx='rr vagrant "sudo /etc/init.d/nginx restart"'