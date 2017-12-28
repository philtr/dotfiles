#!/usr/bin/env bash
source ~/.dotfiles/bitbar/slack_status/helpers.sh
curl -X POST https://slack.com/api/users.profile.set\?token\=$SLACK_API_TOKEN\&profile\=%7B%22status_text%22:%22Status%20set%20via%20API%20call%22,%22status_emoji%22:%22:sunglasses:%22%7D
