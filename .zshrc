#skipping this speeds up load time by 200ms, doesn't seem to break anything
#skip_global_compinit=1
source ~/antigen/antigen.zsh

#Load oh-my-zsh and standard plugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle osx
antigen bundle brew
antigen bundle git-extras
antigen bundle composer
antigen bundle sudo
antigen bundle jira

#Load third party plugins
antigen bundle zsh-users/zsh-syntax-highlighting

#Add themes
antigen theme dersam/staples staples

#Load personal customizations
antigen bundle $HOME/dotfiles/custom --no-local-clone

antigen apply

source ~/extra.zsh

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
