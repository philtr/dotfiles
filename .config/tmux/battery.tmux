#!/usr/bin/env bash
# Plug and play battery percentage and icon indicator for Tmux
# https://github.com/tmux-plugins/tmux-battery

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="$CURRENT_DIR/battery"

source "$SCRIPTS_DIR/helpers.sh"

battery_interpolation=(
  "\#{battery_percentage}"
  "\#{battery_remain}"
  "\#{battery_icon}"
  "\#{battery_status_bg}"
  "\#{battery_status_fg}"
  "\#{battery_graph}"
)
battery_commands=(
  "#($SCRIPTS_DIR/battery_percentage.sh)"
  "#($SCRIPTS_DIR/battery_remain.sh)"
  "#($SCRIPTS_DIR/battery_icon.sh)"
  "#($SCRIPTS_DIR/battery_status_bg.sh)"
  "#($SCRIPTS_DIR/battery_status_fg.sh)"
  "#($SCRIPTS_DIR/battery_graph.sh)"
)

set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

do_interpolation() {
  local all_interpolated="$1"
  for ((i=0; i<${#battery_commands[@]}; i++)); do
    all_interpolated=${all_interpolated/${battery_interpolation[$i]}/${battery_commands[$i]}}
  done
  echo "$all_interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}
main
