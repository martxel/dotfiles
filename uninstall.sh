#!/usr/bin/env bash

ignored_files="README.md\|install.sh\|uninstall.sh\|gnome-terminal-colors\|screenshoot.png"
files=$(ls -1 | grep -vw $ignored_files)

# remove symbolic links
for file in $files; do
  if [[ -h $HOME/.$file ]]; then
    rm -frv $HOME/.$file
  else
    echo -e "\e[33m$HOME/.$file is not a symbolic link or doesn't exist\e[0m"
  fi
done

echo -e "\e[32mDone!\e[0m"
