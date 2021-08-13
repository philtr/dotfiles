alias dots='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

. "$(brew --prefix asdf)/asdf.sh"

alias vim=nvim

# Use a super basic prompt configuration
export PROMPT="%F{white}%1~ %F{green}%%%f "
export RPROMPT="%F{black}%T"

# Zoxide (fast cd)
if (( $+commands[zoxide] )) ; then
  eval "$(zoxide init zsh)"
fi

# Git
alias gc="git commit"
alias gcb="git rev-parse --abbrev-ref HEAD"
alias gco="git checkout"
alias gd="git difftool"
alias gglg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias ggpush="git push origin \`gcb\`"
alias ggpushf="ggpush --force-with-lease"
alias gst="git status -sb"

# Completions
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

zmodload -i zsh/complist

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
