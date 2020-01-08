#!/bin/sh

ARGS="$@"

set -e
set -x

podman run $ARGS -i -t --rm -h freeipa.example.org freeipa-tester \
       "ipa user-find"
