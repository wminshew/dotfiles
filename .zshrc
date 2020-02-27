# profiling zsh startup
# zmodload zsh/zprof

# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

export plugins=(emacs vi-mode colored-man-pages colorize git kubectl gcloud docker brew osx asdf fzf httpie heroku redis-cli history-substring-search)
# ruby rails python golang npm tmux
. $ZSH/oh-my-zsh.sh

# User configuration

# make sure ~/.zsh_history doesn't belong to root
unsetopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# bind up/down keys to only show historical commands matching the typed substring
# https://unix.stackexchange.com/questions/97843/how-can-i-search-history-with-text-already-entered-at-the-prompt-in-zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

alias startx="sudo systemctl isolate graphical.target"
alias pcat='pygmentize -f terminal256 -O style=native -g'

# asdf version manager
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# ag completions
. /usr/local/share/zsh/site-functions

# Perform compinit only once a day.
autoload -Uz compinit

setopt EXTENDEDGLOB
for dump in $ZSH_COMPDUMP(#qN.m1); do
  compinit
  if [[ -s "$dump" && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
    zcompile "$dump"
  fi
  echo "Initializing Completions..."
done
unsetopt EXTENDEDGLOB
compinit -C

# profiling zsh startup
# zprof
