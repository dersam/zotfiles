OSX/Linux dotfiles for zsh, managed via antigen.

Supports an ~/extra.zsh file for adding customizations for your local
environment.

Majority of bundle loading occurs in .zshrc, which is symlinked out via zot.

Any configs that already exist that match a dotfile that zot wants to link will
be obliterated. Use with caution- the list of symlinks begins at "Symlinking Configs"
in `zot.sh`.

# Features
* Auto-update and installation with `zot.sh`
* Custom configs for tmux using tmuxinator.
* Special bin directory for custom scripts
* Automatic downloader for scripts stored as github gists, placing them in the $PATH

#Installation
* Run zot.sh (it will alias itself to `zot` after the first run).
* Zot will overwrite anything that it wants to symlink (such as gitconfig).
* Running zot will update both the local repo, and the antigen repos.
* Enjoy new experience.

# Updating
Run `zot`. Everything will auto-update.

#Contributors
Samuel Schmidt

Heavily based on https://github.com/danemacmillan/dotfiles.
