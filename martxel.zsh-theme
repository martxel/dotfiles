# martxel.zsh-theme - ZSH Theme

# colors
if [[ $TERM = *256color* ]];
then
  green="%F{84}"
  blue="%F{153}"
  red="%F{167}"
  yellow="%F{143}"
else
  green="$fg[green]"
  blue="$fg[blue]"
  red="$fg[red]"
  yellow="$fg[yellow]"
fi

local return_code="%(?..%{$red%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$green%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$blue%} %~%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$red%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$red%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="${user_host} ${current_dir} ${rvm_ruby} ${git_branch}
%B➜%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$yellow%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
