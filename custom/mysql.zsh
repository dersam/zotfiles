#Bindings and such to make mysql cli good?!

alias mysql="mycli"
export DEV_DB_NAME="develop"

devdb () {
	mysql -h develop.vagrant.dev -u root -D $DEV_DB_NAME
}