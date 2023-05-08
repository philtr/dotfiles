source $HOME/.local/dotfiles/lib/dot.zsh && dot::init

alias e="${EDITOR:-"vim"}"

# Use vim keys
bindkey -v
bindkey "^R" history-incremental-search-backward

# edit command line in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Use a super basic prompt configuration
export PROMPT_ICON=${PROMPT_ICON:-""}
export PROMPT_ICON_COLOR=${PROMPT_ICON_COLOR:-"magenta"}
export PROMPT="%F{$PROMPT_ICON_COLOR}$PROMPT_ICON  %F{gray}%1~ %F{green}%%%f "
# export RPROMPT="%F{#166775} %F{white}%T%f"

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Zoxide (fast cd)
if (( $+commands[zoxide] )) ; then
  eval "$(zoxide init zsh)"
fi


HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

setopt auto_cd # cd by typing directory name if it's not a command

setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

zmodload -i zsh/complist

# Completions
if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
