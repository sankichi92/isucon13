#!/usr/bin/env bash
set -euo pipefail

mkdir -p ./mnt/isu1
mkdir -p ./mnt/isu2
mkdir -p ./mnt/isu3

sshfs isucon@isu1:/home/isucon ./mnt/isu1
sshfs isucon@isu1:/home/isucon ./mnt/isu2
sshfs isucon@isu1:/home/isucon ./mnt/isu3
