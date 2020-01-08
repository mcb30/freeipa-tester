FreeIPA test data container
===========================

[![Build Status](https://travis-ci.com/unipartdigital/freeipa-tester.svg?branch=master)](https://travis-ci.com/unipartdigital/freeipa-tester)

This container provides a freshly installed FreeIPA server
``freeipa.example.org`` for the realm ``EXAMPLE.ORG``

It can be used to generate test data sets illustrating the behaviour
of FreeIPA.  For example, to create a FreeIPA user and capture the
resulting LDAP data in LDIF format:

```
podman run -i -t --rm -h freeipa.example.org unipartdigital/freeipa-tester \
    "ipa user-add testuser --first Test --last User && \
     ldapsearch '(uid=testuser)'"
```

The container is published on Docker Hub as
[`unipartdigital/freeipa-tester`](https://hub.docker.com/r/unipartdigital/freeipa-tester/).
