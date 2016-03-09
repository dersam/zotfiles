## .osx

export ZSH_HOST_OS=$(uname | awk '{print tolower($0)}')

case $ZSH_HOST_OS in
	darwin*)

# Exports

# Assumes that coreutils and other GNU tools have replaced OSX'
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# Aliases

# Depends on Firefox Tools Adapter: https://developer.mozilla.org/en-US/docs/Tools/Firefox_Tools_Adapter
# TODO: Add checking.
alias debugios='open  /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app; sleep 2s; ios_webkit_debug_proxy'

alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
#alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias flushdns="dscacheutil -flushcache"
#alias update='dotfiles; sudo softwareupdate -i -a -v; brew doctor; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'
alias update='zot; composer selfupdate; softwareupdate -i -a -v; brew doctor; brew update; brew upgrade; brew cleanup'


# OSX settings
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock
# Faster keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0
;;
esac
