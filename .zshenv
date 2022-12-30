eval $(/opt/homebrew/bin/brew shellenv)
eval "$(direnv hook zsh)"

export VISUAL=nvim
export EDITOR="$VISUAL"

export CPATH="$(brew --prefix)/include"
export LIBRARY_PATH="$(brew --prefix)/lib"

export XDG_CONFIG_HOME=$HOME/.config
export K9SCONFIG=$XDG_CONFIG_HOME/k9s

export BAT_THEME="base16"
export FZF_DEFAULT_OPTS="--color=16"

export PATH="/opt/homebrew/bin:$PATH:$HOME/.bin"

# Enables history in IEx
export ERL_AFLAGS="-kernel shell_history enabled"
# For compiling erlang
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
# Enable erlang docs for IEx help function
export KERL_BUILD_DOCS="yes"

