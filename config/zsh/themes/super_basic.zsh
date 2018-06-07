autoload -U colors; colors

precmd() {
  git status >& /dev/null
  if [ $? -eq 0 ]; then
    local revision="$(git rev-parse --short HEAD)"
    local branch="$(git rev-parse --abbrev-ref HEAD)"
    export RPROMPT="%{$fg_bold[black]%}$branch%{%f%} %{$fg_bold[green]%}•%{%f%} $revision"
  fi

  export PROMPT="%~ %F{green}%%%f "
}
