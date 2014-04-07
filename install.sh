#!/usr/bin/env bash

# dotfiles
files="zprezto vim ctags dir_colors gemrc gitconfig gitignore tmux.conf \
  vimrc vimrc.bundles zlogin zlogout zpreztorc zprofile zshenv zshrc"

# link dotfiles
for file in $files; do
  ln -sv $PWD/$file $HOME/.$file
done

echo Done!
