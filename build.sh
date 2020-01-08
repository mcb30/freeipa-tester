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
       "ipa-server-install --unattended --no-pkinit --no-ntp --no-host-dns \
                           --realm EXAMPLE.ORG --ds-password password \
                           --admin-password password && \
        echo password | kinit admin && \
        mkdir -p /var/kerberos/krb5/user/0/ && \
        echo -e 'password\npassword' | \
             ipa-getkeytab -p admin -P \
                           -k /var/kerberos/krb5/user/0/client.keytab && \
        systemctl mask nis-domainname.service"
podman commit $ARGS --change 'CMD []' freeipa-tester freeipa-tester

# Clean up
#
podman rm $ARGS freeipa-tester
podman rmi $ARGS freeipa-tester-pre
