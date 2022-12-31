#!/usr/bin/env zsh

# configure environment variables
function dot::init() {
  export DOTFILES_HOME=${DOTFILES_HOME:-$HOME}
  export DOTFILES_DATA=${DOTFILES_DATA:-$DOTFILES_HOME/.local/dotfiles}
  export DOTFILES=${DOTFILES:-$DOTFILES_DATA/.dotfiles.git}
  export DOTFILES_BIN=${DOTFILES_BIN:-$DOTFILES_DATA/bin}
  export DOTFILES_LIB=${DOTFILES_LIB:-$DOTFILES_DATA/lib}
  export PATH="$DOTFILES_BIN:$PATH"
}

# run a dot-* command if it exists, otherwise delegate to git
function dot::cmd() {
  # show the help information if no arguments are provided
  if [[ $# -le 0 ]]; then
    dot::help
    return 1
  fi

  if dot::exists $1; then
    local cmd="$(dot::sub $1)"
    shift
    dot::env $cmd $@
  else
    dot-git "$@"
  fi
}

# returns the dot- prefixed command, eg 'mycmd' => 'dot-mycmd'
function dot::sub() {
  echo "dot-$1"
}

# returns 1 if the subcommand exists
function dot::exists() {
  local cmd="$(dot::sub $1)"
  [[ $(whence -p $cmd) ]]
}

# run an arbitrary command with the git environment variables set
function dot::env() {
  env GIT_DIR=$DOTFILES GIT_WORK_TREE=$DOTFILES_HOME $@
}

# show the help text
function dot::help() {
  cat >&2 << USAGE
dot - Dotfiles management tool

Usage: dot [<command>] [options]

Performs operations in the dotfiles context by setting GIT_DIR and
GIT_WORK_TREE environment variables.

Any unrecognized subcommand will delegate to 'git', for example:

  $ dot status

Available commands:
  env <command>       Run any command in the dotfiles context 
  git <command>       Perform a Git operation in the dotfiles context
  help                Show this help message
USAGE
}

# makes dot::help available as "dot help"
function dot-help() { dot::help }

# Only set up the installer script if we are being eval'd
if [[ $zsh_eval_context =~ "eval" ]]; then

  # install these dotfiles on a new machine
  function dot::install() {
    dot::init
    dot::install::clone
    dot::install::checkout
  }

  # the repo and branch we plan to clone
  function dot::install::repo() {echo ${DOTFILES_REPO:-"philtr/dotfiles"} }
  function dot::install::branch() { echo ${DOTFILES_BRANCH:-"main"} }

  # clone the dotfiles repo into $DOTFILES
  function dot::install::clone() {
    if [[ DOTFILES_CLONE_HTTPS = "yes" ]]; then
      local repo_uri="https://github.com/$(dot::install::repo).git"
    else
      local repo_uri="https://github.com/$(dot::install::repo).git"
    fi

    git clone \
      --config status.showUntrackedFiles=no \
      --config push.autoSetupRemote=true \
      --bare "$repo_uri" $DOTFILES
  }

  # checkout the branch into $DOTFILES_HOME (defaults to $HOME)
  function dot::install::checkout() {
    dot::env git checkout $(dot::install::branch) $@ ||
      print -P "\n%F{red}Back up conflicting files, then run"\
        "%F{blue}\`dot checkout -f $(dot::install::branch)\`%F{reset}"
  }

  # run the install script
  dot::install
fi
