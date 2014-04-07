#!/usr/bin/env bash

# dotfiles
files="zprezto vim ctags dir_colors gemrc gitconfig gitignore tmux.conf \
  vimrc vimrc.bundles zlogin zlogout zpreztorc zprofile zshenv zshrc"

# remove symbolic links
for file in $files; do
  if [[ -h $HOME/.$file ]]; then
    rm -frv $HOME/.$file
  else
    echo $HOME/.$file is not a symbolic link or doesn't exist
  fi
done

echo Done!
