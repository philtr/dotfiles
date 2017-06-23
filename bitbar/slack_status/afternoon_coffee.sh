#!/usr/bin/env bash
source ~/.dotfiles/bitbar/slack_status/helpers.sh
curl -X POST https://slack.com/api/users.profile.set\?token\=$SLACK_API_TOKEN\&profile\=%7B%22status_text%22:%22Afternoon%20Coffee%20%28One%20of%20those%20days%29%22,%22status_emoji%22:%22:coffee:%22%7D
