#!/usr/bin/env bash
source $DOTS/bitbar/slack_status/helpers.sh
curl -X POST https://slack.com/api/users.profile.set\?token\=$SLACK_API_TOKEN\&profile\=%7B%22status_emoji%22:%22:mag_right:%22%7D
