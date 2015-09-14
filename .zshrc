source ~/antigen/antigen.zsh

#Load oh-my-zsh and standard plugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle osx
antigen bundle web-search
antigen bundle git-extras
antigen bundle node
antigen bundle npm
antigen bundle composer
antigen bundle sudo
antigen bundle wd

#Load third party plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rimraf/k

#Install and configure Z
antigen bundle rupa/z
add-zsh-hook precmd _z_precmd
function _z_precmd {
	_z --add "$PWD"
}

#Load personal customizations
antigen bundle $HOME/zotfiles/custom --no-local-clone

#set up theme
antigen theme dersam/staples staples

antigen apply