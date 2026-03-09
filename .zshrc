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

plugins=(emacs vi-mode colored-man-pages colorize jsontools git kubectl gcloud docker brew macos fzf httpie redis-cli history-substring-search direnv tmux)
# ruby rails python golang npm
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
alias svim="sudoedit"
alias find="fd"
alias startx="sudo systemctl isolate graphical.target"
alias pcat='pygmentize -f terminal256 -O style=native -g'

# Perform compinit only once a day.
autoload -Uz compinit
autoload -Uz bashcompinit

setopt EXTENDEDGLOB
for dump in $ZSH_COMPDUMP(#qN.m+1); do
  compinit
  if [[ -s "$dump" && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
    zcompile "$dump"
  fi
  echo "Initializing Completions..."
done
unsetopt EXTENDEDGLOB
compinit -C
bashcompinit

# use 'fd' to enter vi-cmd-mode
bindkey 'fd' vi-cmd-mode

# enable C-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# increase open file limit
# ulimit -n 1024
ulimit -S -n 4096

# . "$HOME/.cargo/env"

# rustup completions zsh > $HOME/.oh-my-zsh/completions/_rustup
# rustup completions zsh cargo > $HOME/.oh-my-zsh/completions/_cargo

# forge completions zsh > $HOME/.oh-my-zsh/completions/_forge
# cast completions zsh > $HOME/.oh-my-zsh/completions/_cast

