#!/usr/bin/env bash

docker-ip() {
  docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$@"
}

echo "---" > pipeline-variables.yml
echo "sinopia: http://"$(docker-ip privateregistry_sinopia_1)":4873" >> pipeline-variables.yml