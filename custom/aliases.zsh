# .aliases

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

# History
# Purge all history
alias historypurgeall='cat /dev/null > ~/.bash_history && history -c && history -w'
# Source: http://thoughtsbyclayg.blogspot.ca/2008/02/how-to-delete-last-command-from-bash.html
alias historypurgelast='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'

alias zot=". $HOME/zotfiles/zot.sh"
