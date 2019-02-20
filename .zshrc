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
#antigen bundle n98-magerun
antigen bundle jira

#Load third party plugins
antigen bundle zsh-users/zsh-syntax-highlighting

#Add themes
antigen theme dersam/staples staples

#Load personal customizations
antigen bundle $HOME/zotfiles/custom --no-local-clone

antigen apply

source ~/extra.zsh
#source ~/zotfiles/bin/gist/weatherfunk.zsh
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
