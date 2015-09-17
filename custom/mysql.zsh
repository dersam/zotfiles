#Bindings and such to make mysql cli good?!

alias mysql="mycli"

devdb () {
	mysql -h develop.vagrant.dev -u root -D production
}