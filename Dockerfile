FROM unipartdigital/fedora-systemd

RUN dnf update -y --setopt=tsflags=nodocs --setopt=install_weak_deps=False \
    && dnf install -y --setopt=tsflags=nodocs --setopt=install_weak_deps=False \
	freeipa-client \
	freeipa-server \
	openldap-clients \
    && dnf clean all

RUN systemctl mask auth-rpcgss-module.service && \
    systemctl disable var-lib-nfs-rpc_pipefs.mount
