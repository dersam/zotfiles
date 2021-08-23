###########
#apps.zsh
#
# Contains customizations and shortcuts for various applications.
###########

# VSCode
vs () {
	code .
}

cmaster () {
	git checkout master
}

clast () {
	git checkout @{-1}
}

clastn () {
	git checkout @{-$1}
}

# export EVENT_NOKQUEUE=1
