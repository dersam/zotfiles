OSX/Linux dotfiles for zsh, managed via antigen.

Supports an ~/extra.zsh file for adding customizations for your own specific
environment.

Majority of bundle loading occurs in .zshrc, which is symlinked out via zot.

#Installation
* Run zot.sh (it will alias itself to `zot` after the first run).
* Zot will overwrite anything that it wants to symlink (such as gitconfig).
* Running zot will update both the local repo, and the antigen repos.

#Contributors
Samuel Schmidt

Heavily based on https://github.com/danemacmillan/dotfiles.

#TODO
* improve the abstraction of usables in the staples theme.
