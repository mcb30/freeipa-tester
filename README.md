FreeIPA test data container
===========================

[![Build](https://img.shields.io/github/workflow/status/mcb30/freeipa-tester/Build)](https://github.com/mcb30/freeipa-tester/actions?query=workflow%3ABuild+branch%3Amaster)
[![Image](https://img.shields.io/docker/pulls/mcb30/freeipa-tester)](https://hub.docker.com/r/mcb30/freeipa-tester/)

This container provides a freshly installed FreeIPA server
``freeipa.example.org`` for the realm ``EXAMPLE.ORG``

It can be used for quick and easy experiments against a throwaway
FreeIPA instance.  For example:

```
podman run -i -t --rm -h freeipa.example.org mcb30/freeipa-tester sh
```

will give you an interactive shell in which you can try out FreeIPA
commands:

```console
sh-5.0# ipa user-add testuser
First name: Test
Last name: User
---------------------
Added user "testuser"
---------------------
  User login: testuser
  First name: Test
  Last name: User
  Full name: Test User
  Display name: Test User
  Initials: TU
  Home directory: /home/testuser
  GECOS: Test User
  Login shell: /bin/sh
  Principal name: testuser@EXAMPLE.ORG
  Principal alias: testuser@EXAMPLE.ORG
  Email address: testuser@example.org
  UID: 42000001
  GID: 42000001
  Password: False
  Member of groups: ipausers
  Kerberos keys available: False
```

The container can also be used to generate automated test data sets
illustrating the behaviour of FreeIPA.  For example, to create a
FreeIPA user and capture the resulting LDAP data in LDIF format:

```
podman run -i -t --rm -h freeipa.example.org mcb30/freeipa-tester \
    "ipa user-add testuser --first Test --last User && \
     ldapsearch '(uid=testuser)'"
```

The container is published on Docker Hub as
[`mcb30/freeipa-tester`](https://hub.docker.com/r/mcb30/freeipa-tester/).
