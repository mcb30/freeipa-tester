#!/bin/sh

ARGS="$@"

set -e
set -x

podman run $ARGS -i -t --rm --cap-add CAP_SYS_ADMIN \
           --hostname freeipa.example.org freeipa-tester \
       "echo password | kinit admin && ipa user-find"
