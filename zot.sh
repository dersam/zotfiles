#!/usr/bin/env zsh
cd $HOME
autoload -U colors
colors

source ~/zotfiles/custom/formatting.zsh

echo -e "${BLUE}${BOLD}Checking for updates...${RESET}"
cd ~/zotfiles && git pull

echo -e "${RESET}${BLUE}${BOLD}Updating oh-my-zsh custom modules...${RESET}${GREEN}${DIM}"
ln -vsfn ~/zotfiles/custom/* ~/.oh-my-zsh/custom
echo -e "Symlinking configs..."
ln -vsfn ~/zotfiles/configs/.gitconfig ~/
echo -e "Symlinking themes..."
ln -vsfn ~/zotfiles/themes/staples.zsh-theme ~/.oh-my-zsh/themes/
echo -e "${RESET}"

if [[ -f $HOME/z.sh ]]; then
	echo -e "${RESET}${BLUE}${BOLD}Z.sh is installed.${RESET}${GREEN}${DIM}"
else
	echo -e "${RESET}${BLUE}${BOLD}Installing Z.sh...${RESET}${GREEN}${DIM}"
	git clone git@github.com:rupa/z.git
	ln -vsfn ~/zotfiles/z/z.sh ~/z.sh
fi

echo -e "Reloading zotfiles..."
source ~/.zshrc