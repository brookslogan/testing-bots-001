#!/bin/bash

# exit on any error, or reference to an undefined variable
set -eu

# not sure what all curl can output; use --silent and &> /dev/null to not overly rely on GitHub's scrubbing
curl --silent --request POST "$SECRET_STALE_QUESTION_NOTIFY_WEBHOOK" &> /dev/null
