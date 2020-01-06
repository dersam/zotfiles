########
# code.zsh
#
# Customizations and functions useful for development.
########

# Boot mobile emulators.
msim () {
	if [[ $1 == 'ios' ]]; then
		open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
	fi
}

# Runs cli php with an attached debugger
alias phpdebug='PHP_IDE_CONFIG="serverName=develop.vagrant.dev" /usr/bin/env php -d "xdebug.idekey=PHPSTORM" -d "xdebug.remote_host=192.168.80.1" -d "xdebug.remote_port=9000" -d "xdebug.remote_enable=1" -d "xdebug.remote_autostart=1" -d "xdebug.remote_handler=dbgp"'

# Opens a url with phantomjs
alias inphantom="phantomjs --webdriver=8643 --debug=true --ssl-protocol=any --ignore-ssl-errors=true"

##
# Find all Magento events in current path or path provided.
magevents()
{
	if hash ag 2>/dev/null ; then
		local magento_path=""
		if [[ -n "$1" ]]; then
			magento_path="$1"
			ag --php -A 5 -C 0 --depth 50 -f -i "Mage::dispatchEvent" "$magento_path"
		else
			echo "Provide path to search for Magento events."
		fi
	else
		echo "ag / silver_searcher is required."
	fi
}

binary ()
{
	echo "obase=2;$1" | bc
}
