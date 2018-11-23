#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    ver='latest'
  else
    ver=$1
fi

docker build -t fsnexus.evry.com:8087/evryfs/apache-php-web:$ver .
docker push fsnexus.evry.com:8087/evryfs/apache-php-web:$ver

