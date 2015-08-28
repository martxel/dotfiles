set -x LANG es_ES.UTF-8
set -x TERM xterm-256color
set -x GOPATH $HOME/go
set -x PATH $HOME/bin $GOPATH/bin $PATH
set -x SCALA_HOME $HOME/Applications/scala
set -x WORKON_HOME $HOME/.virtualenvs
set -x EDITOR 'vim'
set -x VISUAL 'vim'
set -x PAGER 'less'

set -e fish_greeting

fish_vi_mode
