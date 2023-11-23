#!/bin/bash

echo "start rescure source files from isu"

function rescure_itamae_file(){
  REMOTE="$1"
  TARGET="$2"
  FILE_PATH="$3"

  rsync -azcP $REMOTE:"$FILE_PATH" "./itamae/cookbooks/${TARGET}/files/${FILE_PATH}"
}

REMOTE="isu1"

echo "rescue webapp"
rsync -azcP $REMOTE:/home/isucon/webapp/ ./webapp

echo "rescue nginx"
rescure_itamae_file $REMOTE nginx /etc/nginx/nginx.conf
rescure_itamae_file $REMOTE nginx /etc/nginx/sites-available/

echo "rescue mysql"
rescure_itamae_file $REMOTE mysql /etc/mysql/conf.d/my.cnf
rescure_itamae_file $REMOTE mysql /etc/mysql/conf.d/mysql.cnf
rescure_itamae_file $REMOTE mysql /etc/mysql/conf.d/mysqldump.cnf
