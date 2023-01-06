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
  deps                Install external dependencies
  env <command>       Run any command in the dotfiles context
  git <command>       Perform a Git operation in the dotfiles context
  help                Show this help message
  nvim                Run neovim in the dotfiles context
  sh                  Enter a new shell using the dotfiles context
USAGE
}

# makes dot::help available as "dot help"
function dot-help() { dot::help }

function dot::deps() {
  dot::deps::homebrew
  dot::deps::asdf
}

# Maybe install and bundle Homebrew dependencies
function dot::deps::homebrew() {
dot::deps::homebrew::install
dot::deps::homebrew::bundle
dot::deps::homebrew::install_fzf
}

# Run the Homebrew installer script
function dot::deps::homebrew::install() {
  # Abort installation if Homebrew is already installed
  [[ ! $(whence -p brew) ]] || return 1

  # Brew install URL
  url="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
  /bin/bash -c "$(curl -fsSL $url)"
}

# Install Homebrew packages found in $HOME/.Brewfile
function dot::deps::homebrew::bundle() {
  brew bundle --global --no-lock --no-upgrade
}

# Install and configure FZF
function dot::deps::homebrew::install_fzf() {
  local args=(
    --xdg             # install shell init file to $XDG_CONFIG/fzf/fzf.zsh
    --key-bindings    # enable setting key bindings
    --completion      # enable completion
    --no-update-rc    # don't modify ~/.zshrc
    --no-bash         # don't create $XDG_CONFIG/fzf/fzf.bash
    --no-fish         # don't create $XDG_CONFIG/fzf/fzf.fish
  )

  /opt/homebrew/opt/fzf/install "${args[@]}"
}

# Maybe install asdf and ensure plugins and versions are up-to-date
function dot::deps::asdf() {
  # install asdf if not already innstalled
  [[ $(whence -p asdf) ]] || dot::deps::asdf::install

  # Make sure plugins in global .tool-versions file are installed
  for plugin in $(cat $DOTFILES_HOME/.tool-versions | awk '{print $1}'); do
    asdf plugin add $plugin;
  done

  asdf plugin update --all

  # install global versions
  asdf install
}

# Install asdf
function dot::deps::asdf::install() {
  echo "Installing asdf-vm..." &&
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf  --branch v0.11.0
  source $HOME/.asdf/asdf.sh
  fpath=(${ASDF_DIR}/completions $fpath)
  autoload -Uz compinit && compinit
}

# install these dotfiles on a new machine
function dot::install() {
  dot::init
  dot::install::clone
  dot::install::checkout
  dot::deps::install
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

# run the installer script automatically if this file is being eval'd
if [[ $zsh_eval_context =~ "eval" ]]; then
  dot::install
fi
