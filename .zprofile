eval $(/opt/homebrew/bin/brew shellenv)
eval "$(direnv hook zsh)"
# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
