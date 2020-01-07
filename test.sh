#!/bin/sh

ARGS="$@"

set -e
set -x

podman run $ARGS -i -t --rm --cap-add CAP_SYS_ADMIN \
           --hostname freeipa.example.org freeipa-tester \
       "kinit -ki && ipa user-find"
