##############
# environment.zsh
#
# Items related to navigation and working in the terminal.
###############

#Environment variables
export PATH=/usr/local/sbin:~/npm-global/bin:$PATH
export EDITOR="vim"
export DISABLE_AUTO_TITLE=true

# Alias the updater script
alias zot=". $HOME/zotfiles/zot.sh"

# Assumes that coreutils and other GNU tools have replaced OSX'
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"


# you should really do something with pig maybe
if [[ -f $HOME/.pigrc ]]; then
	source ~/.pigrc
fi

if [[ -n "$SSH_CLIENT" ]]; then
	DISABLE_UNTRACKED_FILES_DIRTY='true'
fi

# Navigational
#alias ll='ls --color -lah --group-directories-first'
alias ll='ls --color=auto -lah --group-directories-first '
alias lp='k --all'
alias llt='ls --color=auto -laht --group-directories-first' # Sort by newest first.
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Filesystem
alias cp="cp -a"
alias rm="rm -rf"

# DO NOT EVER ALIAS mkdir with -p parents option. IT WILL BREAK INHERITED ACL
# PERMISSIONS.
# http://serverfault.com/questions/197263/conflicts-between-acls-and-umask
# http://savannah.gnu.org/bugs/?19546
# http://debbugs.gnu.org/cgi/bugreport.cgi?bug=14371
# dane's pain is your gain
#alias mkdir="mkdir -p"
alias du="du -h --time"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
#alias ag='ag -lfi --hidden --numbers --column --stats'
alias belinux="find . -type f -exec dos2unix {} \;"

#Recursively search all files in current directory for term
gimme () {
	grep -HrnIi --color=always $1 .
}

# Misc
alias c='clear'
alias vi='vim'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

#Anything that is specific to the OSX environment should go here.
export ZSH_HOST_OS=$(uname | awk '{print tolower($0)}')

case $ZSH_HOST_OS in
	darwin*)

	export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
	export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
	alias ls='gls --color=auto'

	# Aliases
	alias stfu="osascript -e 'set volume output muted true'"
	#alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"
	alias flushdns="dscacheutil -flushcache"
	#alias update='dotfiles; sudo softwareupdate -i -a -v; brew doctor; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'
	alias update='zot; composer selfupdate; softwareupdate -i -a --verbose; brew doctor; brew update; brew upgrade; brew cleanup; npm update -g'


	# OSX settings
	#defaults write com.apple.Dock autohide-delay -float 0 && killall Dock
	# Faster keyboard repeat rate
	defaults write NSGlobalDomain KeyRepeat -int 1
	defaults write NSGlobalDomain InitialKeyRepeat -int 12

;;
esac

# Recursive history search on up arrow.
setopt inc_append_history share_history
bindkey '\eOA' history-beginning-search-backward
bindkey '\e[A' history-beginning-search-backward
bindkey '\eOB' history-beginning-search-forward
bindkey '\e[B' history-beginning-search-forward

dircolorrc=~/dircolors
eval "$(dircolors $dircolorrc)"

alias npms='npm -s'
