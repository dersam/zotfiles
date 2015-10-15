# .aliases

# Make sure no other dotfiles script exists.
unalias dotfiles 2&>/dev/null

# Navigational
#alias ll='ls --color -lah --group-directories-first'
alias ll='k --all'
alias llt='ls --color -laht --group-directories-first' # Sort by newest first.
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Filesystem
alias rm='rm -rf'
alias cp="cp -r"
alias mkdir="mkdir -pv"
alias du="du -h --time"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
#alias ag='ag -lfi --hidden --numbers --column --stats'
alias belinux="find . -type f -exec dos2unix {} \;"

#Network
#alias listen='lsof -i -P | grep LISTEN'
alias listen='lsof -Pnl +M -i4'
alias nsp='netstat -tulpn'
alias ss='lsof -i'
alias ipp="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias vs="vagrant global-status --prune"
# See http://ipinfo.io/developers for more info.
alias ipgeo="curl ipinfo.io"
alias vmt="/usr/bin/vmware-toolbox-cmd"

# Misc
alias c='clear'
alias vi='vim'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Server
# Get the number of php-fpm processes, and their average size in MB.
#alias fpmstat='ps aux | grep php-fpm | wc -l ; ps --no-headers -o "rss,cmd" -C php-fpm | awk '{ sum+=$1 } END { printf ("%d%s\n", sum/NR/1024,"M") }'
alias fpmstat="ps aux | grep php-fpm | wc -l ; ps --no-headers -o \"rss,cmd\" -C php-fpm | awk '{ sum+=\$1 } END { printf (\"%d%s\n\", sum/NR/1024,\"M\") }'"

# Git
# just for reference. Do not rewrite history.
#alias grewritelast='GIT_COMMITTER_DATE="$(date -d \'24 hours ago\')" git commit --amend --date "$(date -d \'24 hours ago\')" && git push --force'
alias gco="git checkout"
alias gp="git pull"
alias gpp="git push"
alias gc="git commit"

# Mitigate fat-fingering and other retardations.
alias gut="git"
alias kk="ll"
alias fuck='$(thefuck $(fc -ln -1))'

# History
# Purge all history
alias historypurgeall='cat /dev/null > ~/.bash_history && history -c && history -w'
# Source: http://thoughtsbyclayg.blogspot.ca/2008/02/how-to-delete-last-command-from-bash.html
alias historypurgelast='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'

alias zot=". $HOME/zotfiles/zot.sh"

#Alias defaults for k
#alias k="k --all --human"

alias websearch="web_search google"

alias prophet="~/boxes/develop/foss/prophet/prophet"
