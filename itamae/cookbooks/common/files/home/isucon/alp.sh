#!/bin/bash

set -eux

DISCORD_WEBHOOK='https://discord.com/api/webhooks/1174315559874203700/SfoQy_6hQqCSOtnUhg2hbXfYcJ6G04B_fbByWu24AqeFsTqnPDJTUip3tFEAUVkCbJBI'

cat /var/log/nginx/access.log \
  | alp json -m "/api/condition/.*,/api/isu/.+/icon,/api/isu/.+/graph,/api/isu/[0-9a-z-]+,/isu/.*" --sort sum -r \
  > /tmp/alp.txt

cat /tmp/alp.txt

curl -X POST -F username="alp[$(hostname)]" -F file=@/tmp/alp.txt "$DISCORD_WEBHOOK" &> /dev/null
