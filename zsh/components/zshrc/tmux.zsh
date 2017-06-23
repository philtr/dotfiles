function txs() {
  tmux_session=$1

  if ! tmux has-session -t "$tmux_session" 2> /dev/null; then
    # Ensure that tmux server is started.
    tmux start-server

    # Create a new session.
    tmux new-session -d -s "$tmux_session"
  fi

  exec tmux attach-session -t "$tmux_session"
}
