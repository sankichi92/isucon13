#!/bin/sh

set -eux

bundle exec itamae ssh -h isu1 roles/default.rb
bundle exec itamae ssh -h isu2 roles/default.rb
bundle exec itamae ssh -h isu3 roles/default.rb
