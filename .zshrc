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
antigen bundle taskwarrior
antigen bundle arialdomartini/oh-my-git

#Load third party plugins
antigen bundle zsh-users/zsh-syntax-highlighting

#Add themes
antigen theme dersam/staples staples
#Use my fork of the oh-my-git themes for goodies from staples.
#antigen theme dersam/oh-my-git-themes oppa-lana-style
#antigen theme arialdomartini/oh-my-git-themes arialdo-pathinline
#antigen theme dersam/oh-my-git-themes arialdo-granzestyle

#Load personal customizations
antigen bundle $HOME/zotfiles/custom --no-local-clone

antigen apply
