#!/usr/bin/env bash

# dotfiles
files="zprezto ctags dir_colors gemrc gitconfig gitignore tmux.conf \
  vimrc zlogin zlogout zpreztorc zprofile zshenv zshrc"

# remove symbolic links
for file in $files; do
  if [[ -h $HOME/.$file ]]; then
    rm -frv $HOME/.$file
  else
    echo -e "\e[33m$HOME/.$file is not a symbolic link or doesn't exist\e[0m"
  fi
done

echo -e "\e[32mDone!\e[0m"
