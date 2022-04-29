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

export plugins=(emacs vi-mode colored-man-pages colorize jsontools git kubectl gcloud docker brew macos asdf fzf httpie heroku redis-cli history-substring-search direnv)
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

alias vim="nvim"
alias find="fd"
alias startx="sudo systemctl isolate graphical.target"
alias pcat='pygmentize -f terminal256 -O style=native -g'

# asdf version manager
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# ag completions
. /usr/local/share/zsh/site-functions

# Perform compinit only once a day.
autoload -Uz compinit
autoload -Uz bashcompinit

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
bashcompinit

# elm completions
. ~/.zsh/elm-sh-completion/elm-completion.sh

# use 'fd' to enter vi-cmd-mode
bindkey 'fd' vi-cmd-mode

# enable C-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# profiling zsh startup
# zprof

# opam configuration
test -r /Users/wminshew/.opam/opam-init/init.zsh && . /Users/wminshew/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# increase open file limit
# ulimit -n 1024
ulimit -S -n 4096

forge completions zsh > $HOME/.oh-my-zsh/completions/_forge
cast completions zsh > $HOME/.oh-my-zsh/completions/_cast
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
