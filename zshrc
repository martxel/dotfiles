#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Custom aliases

# Force TERM=screen-256color on ssh
alias ssh="TERM=screen-256color ssh"

# tar
alias untar="tar -zxvf"
alias untarbz2="tar -jxvf"
alias targz="tar -pczf"
