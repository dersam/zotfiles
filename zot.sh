#!/usr/bin/env zsh
curdir=`pwd`
cd $HOME
autoload -U colors
colors

source ~/zotfiles/custom/formatting.zsh

if [[ ! -d $HOME/antigen ]]; then
	cd $HOME
	git clone git@github.com:zsh-users/antigen.git
	cd -
fi

touch ~/extra.zsh

echo -e "${BLUE}${BOLD}Checking for updates...${RESET}"
cd ~/zotfiles && git pull

echo -e "Linking .zshrc..."
ln -vsfn ~/zotfiles/.zshrc ~/.zshrc

echo -e "Symlinking configs..."
ln -vsfn ~/zotfiles/configs/.gitconfig ~/
echo -e "${RESET}"

echo -e "Reloading zotfiles..."
source $HOME/.zshrc

cd $curdir

echo -e "zot complete."