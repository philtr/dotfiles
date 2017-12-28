#!/usr/bin/env bash
source ~/.dotfiles/bitbar/slack_status/helpers.sh
curl -X POST https://slack.com/api/users.profile.set\?token\=$SLACK_API_TOKEN\&profile\=%7B%22status_text%22:%22Be%20Right%20Back%22,%22status_emoji%22:%22:alarm_clock:%22%7D
