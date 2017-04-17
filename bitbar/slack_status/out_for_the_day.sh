#!/usr/bin/env bash
source ~/.dotfiles/bitbar/slack_status/helpers.sh
curl -X POST https://slack.com/api/users.profile.set\?token\=$SLACK_API_TOKEN\&profile\=%7B%22status_text%22:%22Out%20for%20the%20Day%22,%22status_emoji%22:%22:city_sunset:%22%7D
