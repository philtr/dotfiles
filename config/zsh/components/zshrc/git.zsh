# Git
alias gc="git commit"
alias gcb="git rev-parse --abbrev-ref HEAD"
alias gco="git checkout"
alias gd="git difftool"
alias gglg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias ggpush="git push origin \`gcb\`"
alias gst="git status -sb"

# new empty branch
function gneb {
  git checkout --orphan $1
  git reset --hard
}
