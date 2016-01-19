tn () {
	task $1 modify +next
	task sync
}

td () {
	task $1 done
	task sync
}

ta () {
	task add $@
	task sync
}
