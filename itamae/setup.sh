#!/bin/sh

set -eux

bundle exec itamae ssh -h isu1 roles/setup.rb
bundle exec itamae ssh -h isu2 roles/setup.rb
bundle exec itamae ssh -h isu3 roles/setup.rb
