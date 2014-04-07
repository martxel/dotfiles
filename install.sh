#!/usr/bin/env bash

# dotfiles
files="zprezto ctags dir_colors gemrc gitconfig gitignore tmux.conf \
  vimrc zlogin zlogout zpreztorc zprofile zshenv zshrc"

# link dotfiles
for file in $files; do
  # remove old links
  if [[ -h $HOME/.$file ]]; then
    rm -frv $HOME/.$file
  fi
  # create links if there aren't files with the same name
  if [[ ! -e $HOME/.$file ]]; then
    ln -sv $PWD/$file $HOME/.$file
  else
    echo -e "\e[33m$HOME/.$file already exists and it's not a symbolic link\e[0m"
  fi
done

echo -e "\e[32mDone!\e[0m"
