#Environment variables
export PATH=/usr/local/sbin:~/npm-global/bin:$PATH
export EDITOR="vim"
export DISABLE_AUTO_TITLE=true

# you should really do something with pig maybe
if [[ -f $HOME/.pigrc ]]; then
	source ~/.pigrc
fi

if [[ -n "$SSH_CLIENT" ]]; then
	DISABLE_UNTRACKED_FILES_DIRTY='true'
fi

# Navigational
#alias ll='ls --color -lah --group-directories-first'
alias ll='ls --color -lah --group-directories-first '
alias lp='k --all'
alias llt='ls --color -laht --group-directories-first' # Sort by newest first.
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Filesystem
alias cp="cp -a"
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

# Misc
alias c='clear'
alias vi='vim'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# History
# Purge all history
alias historypurgeall='cat /dev/null > ~/.bash_history && history -c && history -w'
# Source: http://thoughtsbyclayg.blogspot.ca/2008/02/how-to-delete-last-command-from-bash.html
alias historypurgelast='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'

alias zot=". $HOME/zotfiles/zot.sh"

#Useful OSX Stuff
export ZSH_HOST_OS=$(uname | awk '{print tolower($0)}')

case $ZSH_HOST_OS in
	darwin*)

# Exports

# Assumes that coreutils and other GNU tools have replaced OSX'
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# Aliases

alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
#alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias flushdns="dscacheutil -flushcache"
#alias update='dotfiles; sudo softwareupdate -i -a -v; brew doctor; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'
alias update='zot; composer selfupdate; softwareupdate -i -a --verbose; brew doctor; brew update; brew upgrade; brew cleanup; sudo npm install npm -g; npm update -g'


# OSX settings
#defaults write com.apple.Dock autohide-delay -float 0 && killall Dock
# Faster keyboard repeat rate
#defaults write NSGlobalDomain KeyRepeat -int 1
;;
esac

setopt inc_append_history share_history
bindkey '\eOA' history-beginning-search-backward
bindkey '\e[A' history-beginning-search-backward
bindkey '\eOB' history-beginning-search-forward
bindkey '\e[B' history-beginning-search-forward
