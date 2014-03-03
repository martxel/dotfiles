#!/usr/bin/env bash

SRC=$PWD
DST=$HOME
FORCE=0

# SRC and DST for each file/dir
declare -A dotfiles
dotfiles[$SRC/vimrc]=$DST/.vimrc
dotfiles[$SRC/vimrc.bundles]=$DST/.vimrc.bundles
dotfiles[$SRC/vim]=$DST/.vim
dotfiles[$SRC/gemrc]=$DST/.gemrc
dotfiles[$SRC/tmux.conf]=$DST/.tmux.conf
dotfiles[$SRC/gitconfig]=$DST/.gitconfig
dotfiles[$SRC/oh-my-zsh]=$DST/.oh-my-zsh
dotfiles[$SRC/zshrc]=$DST/.zshrc
dotfiles[$SRC/zalias]=$DST/.zalias
dotfiles[$SRC/zprofile]=$DST/.zprofile
dotfiles[$SRC/martxel.zsh-theme]=$DST/.oh-my-zsh/custom/themes/martxel.zsh-theme
#dotfiles[$SRC/ssh/config]=$DST/.ssh/config
dotfiles[$SRC/dir_colors]=$DST/.dir_colors
dotfiles[$SRC/ctags]=$DST/.ctags
dotfiles[$SRC/gitignore]=$DST/.gitignore

# Set force flag
if [[ $1 = -f ]]; then
  FORCE=1
fi

# Link file
function link() {
  ln -sv $1 ${dotfiles[$1]}
}

# Delete file
function delete() {
  rm -fr ${dotfiles[$1]}
}

# Delete and link file
function delete_and_link() {
  delete $1
  link $1
}

# Process a dotfile
function process_file() {
  local file=$1

  # If DST file/dir exists
  if [[ -e "${dotfiles[$file]}" ]]; then
    if [[ "${FORCE}" -eq 0 ]]; then
      printf "${dotfiles[$file]}"" already exists.\n"
      read -p "Do you want to replace it? (y/N) " -r
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        delete_and_link $file
      fi
    else
      delete_and_link $file
    fi
  else
    # Directory that may contain the target file/dir
    local target_dir=`dirname ${dotfiles[$file]}`
    # If target directory doesn't exist
    if [[ ! -e $target_dir ]]; then
      if [[ "${FORCE}" -eq 0 ]]; then
        printf $target_dir" doesn't exist.\n"
        read -p "Do you want to create it? (Y/n) " -r
        if [[ ! $REPLY =~ ^[Nn]$ ]]; then
          mkdir -p $target_dir
          printf $target_dir" created.\n"
          link $file
        fi
      else
        mkdir -p $target_dir
        printf $target_dir" created.\n"
        link $file
      fi
    else
      link $file
    fi
  fi
}

# Process each dotfile
for dotfile in "${!dotfiles[@]}"; do
  process_file $dotfile
  printf "\n"
done

# Install vim bundles?
read -p "Do you want to run vim +BundleInstall? (Y/n) " -r
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
  vim -u ~/.vimrc.bundles +BundleInstall +qall
fi

# Done!
printf "\nDone!\n"
