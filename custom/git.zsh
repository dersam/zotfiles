cdevelop () {
	git checkout develop
}

cstage () {
	git checkout stage
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
