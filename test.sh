#!/bin/sh

ARGS="$@"

set -e
set -x

podman run $ARGS -i -t --rm --systemd=always \
       --hostname freeipa.example.org freeipa-tester \
       "ipa user-find"
