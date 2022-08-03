#!/bin/bash

# Exit on any error, or reference to an undefined variable; at time of writing,
# these are defensive rather than relied upon.
set -eu

echo "Attempting to trigger webhook by using curl without output;"
echo "if there is a problem, we expect to forward a non-0 exit status from curl,"
echo "but not to output anything further."

# not sure what all curl can output; use --silent and &> /dev/null to not overly
# rely on GitHub's scrubbing. Use --fail to try to get a sensible exit status on
# errors, and --location to follow redirects + get a sensible output status on
# redirects, including when default max-redirs (50) is hit.
#
# FIXME --fail can have some things slip through, according to curl docs.
# --fail-with-body doesn't appear to have the same issues, but is new and isn't
# recognized on ubuntu-latest at time of writing.
curl --fail --location --request POST "$SECRET_STALE_QUESTION_NOTIFY_WEBHOOK"
