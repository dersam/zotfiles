#!/usr/bin/env zsh
curdir=`pwd`
cd $HOME
autoload -U colors
colors

source ~/zotfiles/custom/formatting.zsh

if [[ ! -d $HOME/antigen ]]; then
	echo -e "Antigen not found, installing..."
	cd $HOME
	git clone git@github.com:zsh-users/antigen.git
	cd -
fi

touch ~/extra.zsh

echo -e "${BLUE}${BOLD}Checking for updates...${RESET}"
cd ~/zotfiles && git stash && git pull && git stash pop
antigen update
antigen selfupdate

echo -e "Linking .zshrc..."
ln -vsfn ~/zotfiles/.zshrc ~/.zshrc

echo -e "Symlinking configs..."
ln -vsfn ~/zotfiles/configs/.gitconfig ~/
ln -vsfn ~/zotfiles/configs/.gitignore ~/
ln -vsfn ~/zotfiles/configs/.vimperatorrc ~/
ln -vsfn ~/zotfiles/configs/.my.cnf ~/
ln -vsfn ~/zotfiles/configs/.grcat ~/
ln -vsfn ~/zotfiles/configs/.myclirc ~/
ln -vsfn ~/zotfiles/configs/.taskrc ~/
ln -vsfn ~/zotfiles/configs/.tmux.conf ~/
ln -vsfn ~/zotfiles/configs/.vimrc ~/
mkdir -p ~/.tmuxinator/
ln -vsfn ~/zotfiles/configs/devenv.yml ~/.tmuxinator/
echo -e "${RESET}"

echo -e "Update path..."
PATH=~/zotfiles/bin:$PATH

echo -e "Update Vim Vundles..."
if [ ! -d ~"/.vim/bundle/Vundle.vim" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

echo -e "Reloading zotfiles..."
source $HOME/.zshrc

cd $curdir

echo -e "zot complete."
