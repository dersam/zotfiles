#!/usr/bin/env zsh

autoload -U colors
colors

source ~/zotfiles/custom/formatting.zsh

echo -e "${BLUE}${BOLD}Checking for updates...${RESET}"
cd ~/zotfiles && git pull

echo -e "${RESET}${BLUE}${BOLD}Updating oh-my-zsh custom modules...${RESET}${GREEN}${DIM}"
ln -vsfn ~/zotfiles/custom/* ~/.oh-my-zsh/custom
echo -e "${RESET}"

echo -e "Reloading zotfiles..."
source ~/.zshrc