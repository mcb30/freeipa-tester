FROM unipartdigital/fedora-systemd

RUN dnf update -y --setopt=tsflags=nodocs --setopt=install_weak_deps=False \
    && dnf install -y --setopt=tsflags=nodocs --setopt=install_weak_deps=False \
	freeipa-client \
	freeipa-server \
	git \
	openldap-clients \
	python3-alembic \
	python3-pyyaml \
	python3-sqlalchemy \
    && dnf clean all

RUN systemctl mask auth-rpcgss-module.service && \
    systemctl disable var-lib-nfs-rpc_pipefs.mount
