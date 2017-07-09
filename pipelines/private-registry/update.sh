#!/usr/bin/env bash

docker-ip() {
  docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$@"
}

echo "---" > pipeline-variables.yml
echo "registry-url: http://"$(docker-ip privateregistry_sinopia_1)":4873" >> pipeline-variables.yml
echo "registry-user: npm-cache-resource-tester" >> pipeline-variables.yml
echo "registry-pass: 123456" >> pipeline-variables.yml
echo "registry-email: tester@npm-cache-resource.com" >> pipeline-variables.yml