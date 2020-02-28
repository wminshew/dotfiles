# LANG=en_US.UTF-8

# Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="half-life"

# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf

# Homebrew
export PATH="/usr/local/bin:$PATH"

# set default editor to emacsclient
export VISUAL="emacsclient -c"
export EDITOR="$VISUAL"

# asdf version manager
. /usr/local/opt/asdf/asdf.sh
# . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export fpath=(/usr/local/share/zsh-completions $fpath)

# use pygments & universal-ctags as backend for gtags
export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=pygments

# Speeds up load time
export DISABLE_UPDATE_PROMPT=true

