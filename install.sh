#!/usr/bin/env zsh
autoload -U colors
colors

source ~/dotfiles/custom/formatting.zsh

if [[ ! -d $HOME/antigen ]]; then
	echo -e "Antigen not found, installing..."
	cd $HOME
	git clone https://github.com/zsh-users/antigen.git
	cd -
fi

touch ~/extra.zsh

source ~/antigen/antigen.zsh
antigen update

echo -e "Linking .zshrc..."
ln -vsfn ~/dotfiles/.zshrc ~/.zshrc

echo -e "Symlinking configs..."
#ln -vsfn ~/dotfiles/configs/.gitconfig ~/
ln -vsfn ~/dotfiles/configs/.gitignore ~/
ln -vsfn ~/dotfiles/configs/.tmux.conf ~/
ln -vsfn ~/dotfiles/configs/.vimrc ~/
ln -vsfn ~/dotfiles/configs/dircolors ~/
echo -e "${RESET}"

echo -e "Update path..."
PATH=~/dotfiles/bin:$PATH

echo -e "Update Vim Vundles..."
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/backups
if [ ! -d ~"/.vim/bundle/Vundle.vim" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# echo -e "Configuring tmux..."
# if [ ! -d ~"/.tmux/plugins/tpm" ]; then
# 	git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
# fi



if [ $SPIN ]; then
  sudo apt-get install -y ripgrep

	cat <<EOF > ~/.gitconfig.local
[user]
	email = sam.schmidt@shopify.com
	name = Sam Schmidt
EOF
fi
