
hash foo 2>/dev/null && eval "$(gulp --completion=zsh)"

msim () {
	if [[ $1 == 'ios' ]]; then
		open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
	fi
}