#!/bin/bash

SELFHOST_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CADDYFILE=$SELFHOST_DIR/caddy/Caddyfile

cd $SELFHOST_DIR/caddy
docker compose down

cd $SELFHOST_DIR

for d in $SELFHOST_DIR/services-enabled/*; do
  for caddy in ${d}/*.caddy; do
    cd $d
    docker compose  down
  done
done

cd $SELFHOST_DIR
