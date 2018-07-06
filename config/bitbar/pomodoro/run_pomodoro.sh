#!/usr/bin/env bash

source "$HOME/.dotfiles/config/bitbar/shared/env.sh"

set -euxo pipefail

minutes=$1

function cleanup() {
    curl -X POST -H "Authorization: Bearer ${SLACK_API_TOKEN}" \
        -so /dev/null \
        "https://slack.com/api/dnd.endSnooze"

    curl -X POST -H "Content-Type: application/json" \
        -H "Authorization: Bearer ${SLACK_API_TOKEN}" \
        -d '{"profile": {"status_emoji": "", "status_text": ""}}' \
        -so /dev/null \
        "https://slack.com/api/users.profile.set"

    rm "/tmp/pomodoro"
    rm "/tmp/pomodoro-stop"
}

trap cleanup EXIT

curl -X POST -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${SLACK_API_TOKEN}" \
    -d '{"profile": {"status_emoji": ":tomato:", "status_text": "Pomodoro → '"$minutes"'m left"}}' \
    -so /dev/null \
    "https://slack.com/api/users.profile.set"

curl -X GET -H "Authorization: Bearer ${SLACK_API_TOKEN}" \
    -so /dev/null \
    "https://slack.com/api/dnd.setSnooze?num_minutes=$minutes"

echo "${minutes}m" > "/tmp/pomodoro"

for i in $(seq 1 "$minutes");
do
  if [ -f "/tmp/pomodoro-stop" ]; then
    exit
  fi

  sleep 60
  curl -X POST -H "Content-Type: application/json" \
      -H "Authorization: Bearer ${SLACK_API_TOKEN}" \
      -d '{"profile": {"status_emoji": ":tomato:", "status_text": "Pomodoro → '"$((minutes - i))"'m Left"}}' \
      -so /dev/null \
      "https://slack.com/api/users.profile.set"
  echo "$((minutes-i))m" > "/tmp/pomodoro"
done

terminal-notifier -title "Pomodoro" -appIcon "https://emojipedia-us.s3.amazonaws.com/thumbs/120/facebook/138/tomato_1f345.png" -execute "open slack://" -message "${minutes}m timer complete"

