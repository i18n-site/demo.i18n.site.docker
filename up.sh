#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

if ! command -v docker-compose &>/dev/null; then
  pip install docker-compose
fi

if [ ! -f "./mnt/ssl/127.0.0.1.pem" ]; then
  ./ssl.sh
fi

echo "ROOT=$(realpath $DIR/..)" >.env
docker-compose up -d
