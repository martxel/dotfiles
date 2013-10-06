# PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# 256 color terminal
export TERM="xterm-256color"

# screen-256color for tmux
[ -n "$TMUX" ] && export TERM=screen-256color

# virtualenvwrapper
export WORKON_HOME=~/.pyenv
