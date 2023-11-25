#!/bin/bash

set -eux

sudo mysql -e 'drop database isupipe;'

sudo mysql -e 'create database isupipe;'

cat /home/isucon/webapp/sql/initdb.d/10_schema.sql | sudo mysql isupipe
