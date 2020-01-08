#
# Vi Mode
#
bindkey -v
bindkey -M vicmd '/' history-incremental-search-backward
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
