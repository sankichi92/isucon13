#!/bin/sh

set -eux

DISCORD_WEBHOOK='https://discord.com/api/webhooks/1174307164572090439/ypJBZ4hkY-Gr4CRyzSMk7qU6yeydZHJaI0ECDf-icQWfvzm4scsuf-1gwbZND6qqFUpm'

function discord() {
  curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"${1}\"}" "${DISCORD_WEBHOOK}"
}

discord "deploy(default.sh): start"

isu_hosts=(
  "isu1"
  "isu2"
  "isu3"
)

for host in "${isu_hosts[@]}" ; do
  discord "[${host}]: itamae ssh"
  bundle exec itamae ssh -h "${host}" roles/default.rb
done

discord "deploy(default.sh): finished"
