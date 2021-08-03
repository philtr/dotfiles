alias dots='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
. "$(brew --prefix asdf)/asdf.sh"

alias vim=nvim

# Use a super basic prompt configuration
export PROMPT="%F{white}%1~ %F{green}%%%f "
export RPROMPT="%F{black}%T"
