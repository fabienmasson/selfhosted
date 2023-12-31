#!/bin/bash

SELFHOST_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CADDYFILE=$SELFHOST_DIR/caddy/Caddyfile

rm -rf $CADDYFILE 2> /dev/null
touch $CADDYFILE
cat $SELFHOST_DIR/caddy/keycloak.caddy > $CADDYFILE

for d in $SELFHOST_DIR/services-enabled/*; do
  service=$(basename ${d})
  echo "service : $service"
  for caddy in $d/*.caddy; do
    cat $caddy >> $CADDYFILE
  done
  cd $d
  docker compose up -d
done

cd $SELFHOST_DIR/caddy
docker compose up -d

cd $SELFHOST_DIR
