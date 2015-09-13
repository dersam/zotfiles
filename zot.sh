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

if [[ -f $HOME/z.sh ]]; then
	echo -e "${RESET}${BLUE}${BOLD}Z.sh is installed.${RESET}${GREEN}${DIM}"
else
	echo -e "${RESET}${BLUE}${BOLD}Installing Z.sh...${RESET}${GREEN}${DIM}"
	git clone git@github.com:rupa/z.git
	ln -vsfn ~/zotfiles/z/z.sh ~/z.sh
fi

echo -e "Reloading zotfiles..."
source $HOME/.zshrc

cd $curdir

echo -e "zot complete."