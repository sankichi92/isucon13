#!/bin/bash

set -eux



DISCORD_WEBHOOK='https://discord.com/api/webhooks/1174315559874203700/SfoQy_6hQqCSOtnUhg2hbXfYcJ6G04B_fbByWu24AqeFsTqnPDJTUip3tFEAUVkCbJBI'

cat /var/log/nginx/access.log | alp json -m \
"/api/user/.+/icon"\
",/api/user/.+/statistics"\
",/api/user/.+/theme"\
",/api/livestream/[0-9]+/livecomment"\
",/api/livestream/[0-9]+/reaction"\
",/api/livestream/[0-9]+/report"\
",/api/livestream/[0-9]+/moderate"\
",/api/livestream/[0-9]+/enter"\
",/api/livestream/[0-9]+/exit"\
",/api/livestream/[0-9]+/ngwords"\
",/api/livestream/[0-9]+/statistics"\
",/api/livestream/[0-9]+"\
--sort sum -r \
> /tmp/alp.txt

cat /tmp/alp.txt

curl -X POST -F username="alp[$(hostname)]" -F file=@/tmp/alp.txt "$DISCORD_WEBHOOK" &> /dev/null
