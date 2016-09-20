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

# Server
# Get the number of php-fpm processes, and their average size in MB.
#alias fpmstat='ps aux | grep php-fpm | wc -l ; ps --no-headers -o "rss,cmd" -C php-fpm | awk '{ sum+=$1 } END { printf ("%d%s\n", sum/NR/1024,"M") }'
alias fpmstat="ps aux | grep php-fpm | wc -l ; ps --no-headers -o \"rss,cmd\" -C php-fpm | awk '{ sum+=\$1 } END { printf (\"%d%s\n\", sum/NR/1024,\"M\") }'"

#Images
crunch () {
  case $1 in
    png)
      pngquant --ext=-optimized.png --quality=40-60 *.png
      ;;
    *)
      echo "$1 is not a valid option"
  esac
}

#Redis
startredis() {
	redis-server /usr/local/etc/redis.conf
}

#Docker
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
	options=('help' 'map' 'restart' 'update' 'xdebug' 'xhprof')
	_describe 'values' options
}

compdef _vshell_completion vshell

##
# Remotely run commands with color TTY. If passing chained commands (&&),
# remember to put them within quotation marks.
rr()
{
	if (( $# > 1 )); then
		local remote_server="$1"
		local remote_commands="${@:2}"
		echo -e "${BLUE}${BOLD}Running '\x1B[97;1m$remote_commands${BLUE}' on '$remote_server':${RESET}"
		ssh -qtt $remote_server "$remote_commands"
	fi
}

# Grep for X in a directory
grll ()
{
	ls --color -lah --group-directories-first | grep $1
}

##
# Loop through all subdirectories and run the given command."
loop()
{
	if [[ -z $1 ]]; then
		echo -e "Loop through all subdirectories of the current directory and run"
		echo -e "the given commands.\n"
		echo -e "Example usage:\n"
		echo '  loop "touch notes.txt"'
		echo '  loop "git pull" "git push"'
		echo ""
		return
	fi

	for subdirectory in ./*; do
		echo -e "\n${RESET}\x1B[48;5;234m${TWIRL} \x1B[97;1mRunning commands in \x1B[90m$subdirectory${RESET}"
		for argument in "$@"; do
			echo -e "   ${BOLT} \x1B[93m$argument${RESET}\x1B[38;5;237m"
			(cd "$subdirectory" && $argument 2>&1 | sed -e 's/^/        /')
		done
	done

	echo -e ""
}

##
# Create a local SSH tunnel to a remote service.
# This is just a stub to remember the command.
tun()
{
	local username="$1"
	local service_local="$2"
	local service_remote="$3"
	ssh -f -T -N -L $service_local:$service_remote -pPORT $username@$remote_server
}

##
# Remotely execute SQL and save output locally.
# This is just a stub to remember the command.
rrmy()
{
	ssh -T -pPORT USERNAME@SERVER "mysql -u USERNAME -pPASSWORD -Bs" < "cool.sql" > output.txt
	# Or if no script to execute, use -Bse.
}

##
# Get current OS version and other information.
v()
{
	case $OS in
		osx)
			system_profiler SPSoftwareDataType
			;;
		# Note, at this point nix is technically CentOS. Update .bashrc to
		# represent more OSes.
		nix)
			echo -e "Operating System:\n"
			echo -e "    `cat /etc/redhat-release`\n"
			;;
	esac

	echo -e "Kernel & Architecture:\n"
	echo -e "    `uname -r -v -p`\n"
}

# TODO:
# Create a function to generate archives based on desired output filename.
# E.g.: archive archivename.tgz dirname/
# and the function will know to generate a tar gzip file.
#
# tar cvzf media.tgz --totals media/
#
#

##
# Pass a filename, with archive extension, and this will figure out the rest.
#
# Usage: archive <desiredfilename>.<extension> [ directory | filename ]
#
# For example, type "archive updates.tar.gz updatesdir" and this function will run the
# necessary commands for generating an archive with .tar.gz compression.
#
# Note: bz2 exclusively requires that you just pass bz2 as the desiredfilename
# because it cannot be output into a single file, but each file will be
# individually archived with bzip2 compression.
#
archive()
{
	case $1 in
		*bz2)       bzip2 "${@:2}" ;;
		*.gz)       gzip -c "${@:2}" > $1 ;;
		*.tar)      tar -cvf $1 "${@:2}" ;;
		*.tbz)      tar -jcvf $1 "${@:2}" ;;
		*.tbz2)     tar -jcvf $1 "${@:2}" ;;
		*.tar.bz2)  tar -jcvf $1 "${@:2}" ;;
		*.tgz)      tar -zcvf $1 "${@:2}" ;;
		*.tar.gz)   tar -zcvf $1 "${@:2}" ;;
		*.zip)      zip -r $1 "${@:2}" ;;
		*.ZIP)      zip -r $1 "${@:2}" ;;
		#*.pax)      cat $1 | pax -r ;;
		#*.pax.Z)    uncompress $1 --stdout | pax -r ;;
		#*.Z)        uncompress $1 ;;
		#*.dmg)      hdiutil mount $1 ;;
		*)          echo "'${@:2}' cannot be archived via archive()" ;;
	esac
}

##
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
# Credit: https://github.com/holman/dotfiles
extract ()
{
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2)  tar -jxvf $1 ;;
			*.tar.gz)   tar -zxvf $1 ;;
			*.bz2)      bunzip2 $1 ;;
			*.dmg)      hdiutil mount $1 ;;
			*.gz)       gunzip $1 ;;
			*.tar)      tar -xvf $1 ;;
			*.tbz2)     tar -jxvf $1 ;;
			*.tgz)      tar -zxvf $1 ;;
			*.zip)      unzip $1 ;;
			*.ZIP)      unzip $1 ;;
			*.pax)      cat $1 | pax -r ;;
			*.pax.Z)    uncompress $1 --stdout | pax -r ;;
			*.Z)        uncompress $1 ;;
			*)          echo "'$1' cannot be extracted/mounted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}


##
# Determine size of a file or total size of a directory.
# Credit: https://github.com/mathiasbynens/dotfiles
fs()
{
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi

	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* *;
	fi
}

##
# Get total directory and file count.
# TODO: integrate filesizes
tt()
{
	CHECKDIR=.
	if [[ -n "$1" ]]; then
		CHECKDIR="$1"
	fi

	# Directory listings include "." and ".."
	DIRECTORY_PADDING=1

	DIRECTORIES="`find $CHECKDIR -maxdepth 1 -type d | wc -l`"
	DIRECTORIES_WITH_LINKS="`find $CHECKDIR -follow -maxdepth 1 -type d | wc -l`"
	DIRECTORIES_LINKS="`expr $DIRECTORIES_WITH_LINKS - $DIRECTORIES`"
	FILES="`find $CHECKDIR -maxdepth 1 -type f | wc -l`"
	FILES_WITH_LINKS="`find $CHECKDIR -follow -maxdepth 1 -type f | wc -l`"
	FILES_LINKS="`expr $FILES_WITH_LINKS - $FILES`"

	echo "Directories: `expr $DIRECTORIES_WITH_LINKS - $DIRECTORY_PADDING` (`expr $DIRECTORIES_LINKS`)"
	echo "Files: $FILES_WITH_LINKS ($FILES_LINKS)"
}

##
# Auto-generate new SSH keys with option to provide passphrase
# Note: if you want characters like "!" in your passphrase, run like this:
# newsshkey 'Long passphrase!!!! with spaces and niceties!'
# If you just have regular characters, quoting is unnecessary.
#
# Notes
# SSH keys, a la http://blog.patshead.com/2013/09/generating-new-more-secure-ssh-keys.html
# ssh-keygen -b 4096 -f ~/.ssh/id_rsa_danemacmillan_4096_2014_08 -C danemacmillan@id_rsa_4096_2014_08
newsshkey()
{
	KEY_STRENGTH="4096"
	KEY_NAME=~/.ssh/id_rsa_${KEY_STRENGTH}_`date +%Y-%m-%d-%H%M%S`

	KEY_PASSPHRASE=""
	if [[ -n "$1" ]]; then
		KEY_PASSPHRASE="$1"
	fi

	ssh-keygen -b $KEY_STRENGTH -f $KEY_NAME -C $KEY_NAME -N "$KEY_PASSPHRASE"

	echo -e "\nPassphrase:" \"$KEY_PASSPHRASE\"
	echo -e "\nProvide this public key to your devop if required:\n"
	cat $KEY_NAME.pub

	# Remove passphrase from appearing in bash history, if provided.
	# Source: http://thoughtsbyclayg.blogspot.ca/2008/02/how-to-delete-last-command-from-bash.html
	if [[ -n "$1" ]]; then
		history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))
	fi
}

# Find file
# Usage: ff (file)
ff()
{
  find . -name $1
}

# Allows you to search for any text in any file.
# Usage: ft "my string" *.php
ft()
{
  find . -name "$2" -exec grep -il "$1" {} \;
}

# Calculate MD5 hashes regardless of tool, and ensure identical output.
calculate_md5_hash()
{
	local md5tool=md5sum
	local cut_offset=1

	# OSX comes with md5 tool by default, not md5sum.
	if hash md5 2>/dev/null; then
		local md5tool=md5
		local cut_offset=4
	fi

	local file_path="$1"
	if [[ -f $file_path ]]; then
		echo $($md5tool $file_path | cut -d " " -f$cut_offset)
	fi
}
