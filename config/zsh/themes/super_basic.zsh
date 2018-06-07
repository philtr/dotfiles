autoload -U colors; colors

precmd() {
  # show right prompt for git repos
  git status >& /dev/null
  if [ $? -eq 0 ]; then

    local middle
    local revision="$(git rev-parse --short HEAD)"
    local branch="$(git rev-parse --abbrev-ref HEAD)"

    if [ -n "$(git status --porcelain)" ]; then
      middle="%{$fg[red]%}✕%{%f%}"
    else
      middle="%{$fg_bold[green]%}•%{%f%}"
    fi

    export RPROMPT="%{$fg_bold[black]%}$branch%{%f%} $middle $revision"
  else
    # clear the right prompt
    export RPROMPT=""
  fi

  export PROMPT="%~ %F{green}%%%f "
}
