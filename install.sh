#!/usr/bin/env bash

# dotfiles
files="zprezto ctags dir_colors gemrc gitconfig gitignore tmux.conf \
  vimrc zlogin zlogout zpreztorc zprofile zshenv zshrc"

# link dotfiles
for file in $files; do
  ln -sv $PWD/$file $HOME/.$file
done

echo Done!
