#!/usr/bin/env bash

isCommand() {
  for cmd in \
    "apps" \
    "app" \
    "catalog" \
    "clusters" \
    "cluster" \
    "context" \
    "inspect" \
    "kubectl" \
    "login" \
    "l" \
    "namespaces" \
    "namespace" \
    "nodes" \
    "node" \
    "projects" \
    "project" \
    "ps" \
    "settings" \
    "setting" \
    "ssh" \
    "up" \
    "help" \
    "h"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

# check if the first argument passed in looks like a flag
if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- rancher "$@"
# check if the first argument passed in is rancher
elif [ "$1" = 'rancher' ]; then
  set -- /sbin/tini -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- /sbin/tini -- rancher "$@"
fi

exec "$@"