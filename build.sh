#!/bin/sh

ARGS="$@"

set -e
set -x

# Build base image from Dockerfile
#
podman build $ARGS -t freeipa-tester-pre .

# Install FreeIPA server.  This cannot be done via a RUN stage, since
# it requires systemd to be running.
#
podman run $ARGS -i -t --name freeipa-tester --cap-add CAP_SYS_ADMIN \
           --hostname freeipa.example.org freeipa-tester-pre \
       ipa-server-install --unattended --no-pkinit --realm EXAMPLE.ORG \
                          --ds-password password --admin-password password
podman commit $ARGS --change 'CMD []' freeipa-tester freeipa-tester

# Clean up
#
podman rm $ARGS freeipa-tester
podman rmi $ARGS freeipa-tester-pre
