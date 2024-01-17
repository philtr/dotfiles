# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# A place to put personal executable
export PATH="$HOME/.local/bin:$PATH"

export VISUAL=nvim
export EDITOR="$VISUAL"

export CPATH="$(brew --prefix)/include:$CPATH"
export LIBRARY_PATH="$(brew --prefix)/lib:$LIBRARY_PATH"

export XDG_CONFIG_HOME=$HOME/.config
export K9SCONFIG=$XDG_CONFIG_HOME/k9s

export FZF_DEFAULT_OPTS="--color=16"

# Enables history in IEx
export ERL_AFLAGS="-kernel shell_history enabled"
# For compiling erlang
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
# Enable erlang docs for IEx help function
export KERL_BUILD_DOCS="yes"

eval "$(direnv hook zsh)"
