# set home variable
export XDG_CONFIG_HOME="$HOME/.config"

# default editor
export EDITOR="vim"

# Rustup shell setup
. "$HOME/.cargo/env"

# append commands to history
setopt APPEND_HISTORY

# share history between terminals
setopt SHARE_HISTORY

# set history values
HISTSIZE=100000
SAVEHIST=100000

# prompt
autoload -U colors && colors

USER_COLOR=$fg[green]
AT_COLOR=$fg[green]
HOST_COLOR=$fg[green]
DIR_COLOR=$fg[blue]
RESET=$reset_color

PS1="%B%F{green}%n%b@%B%F{green}%m%b%f:%F{blue}%1~%f%# "
#PS1="%{$fg[green]%}[%{$reset_color%} %{$fg[blue]%}%1~%{$reset_color%}" 
#PS1="%B%n@%m%b: %1~%f %# "

# completion
autoload -Uz compinit
compinit -C

# color aliases
alias ls="ls --color=auto" # GNU only
alias grep="grep --color=auto"
