#!/usr/bin/env bash

SRC=$PWD
DST=$HOME
FORCE=0

# src and dst for each file/dir
declare -A dotfiles
dotfiles[$PWD/vimrc]=$DST/.vimrc
dotfiles[$PWD/vimrc.bundles]=$DST/.vimrc.bundles
dotfiles[$PWD/gemrc]=$DST/.gemrc
dotfiles[$PWD/tmux.conf]=$DST/.tmux.conf
dotfiles[$PWD/gitconfig]=$DST/.gitconfig
dotfiles[$PWD/vim]=$DST/.vim

# set force flag
if [[ $1 = -f ]]
then
  FORCE=1
fi

function link() {
  local file=$1
  ln -sv $file ${dotfiles[$file]}
}

function delete() {
  local file=$1
  rm -fr ${dotfiles[$file]}
}

function delete_and_link() {
  local file=$1
  delete $file
  link $file
}

function process_file() {
  local file=$1
  if [[ -e "${dotfiles[$file]}" ]]
  then
    if [[ "${FORCE}" -eq 0 ]]
    then
      printf "${dotfiles[$file]}"" already exists.\n"
      read -p "Do you want to replace it? (y/N) " -r
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
        delete_and_link $file
      fi
    else
      delete_and_link $file
    fi
  else
    link $file
  fi
}

for dotfile in "${!dotfiles[@]}";
do
  process_file $dotfile
  printf "\n"
done

read -p "Do you want to run vim +BundleInstall? (Y/n) " -r
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
  vim -u ~/.vimrc.bundles +BundleInstall +qall
fi
printf "\nDone!\n"
