# profiling zsh startup
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="half-life"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode colored-man-pages colorize git kubectl gcloud docker brew osx asdf fzf httpie heroku redis-cli)
# other potentially interesting plugins: ruby rails python golang npm tmux

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
# alias dropbox ="~/bin/dropbox.py"
alias startx="sudo systemctl isolate graphical.target"

# added by Anaconda2 4.2.0 installer
# export PATH="/Users/wminshew/anaconda2/bin:$PATH"

# Homebrew
export PATH="/usr/local/bin:$PATH"

# virtualenv / virtualenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Development
# source /usr/local/bin/virtualenvwrapper.sh

# pipsi installation
# export PATH=/Users/wminshew/.local/bin:$PATH

# set GOPATH
# export GOPATH=$HOME/Development/go
# export PATH=$PATH:$GOPATH/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

fpath=(/usr/local/share/zsh-completions $fpath)

# init rbenv
# eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# # export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
# export PATH=/usr/local/cuda-9.0/bin:$PATH
# export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# make sure ~/.zsh_history doesn't belong to root..
unsetopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# add gcloud to path
# export PATH=$PATH:$HOME/Development/google-cloud-sdk/bin

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/will/Development/google-cloud-sdk/path.zsh.inc' ]; then source '/home/will/Development/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/home/will/Development/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/will/Development/google-cloud-sdk/completion.zsh.inc'; fi

# set default editor to vim
export VISUAL=vim
export EDITOR="$VISUAL"

# completions added by oh-my-zsh plugin?
# source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell

# add linkerd to path
# export PATH=$PATH:$HOME/.linkerd2/bin

# heroku autocomplete setup
# HEROKU_AC_ZSH_SETUP_PATH=/Users/wminshew/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Speeds up load time
DISABLE_UPDATE_PROMPT=true

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

# asdf version manager
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# ag completions
. /usr/local/share/zsh/site-functions

# profiling zsh startup
# zprof
