#!/bin/sh

if podman container exists rhel8; then
	if ! podman exec rhel8 true > /dev/null 2>&1; then
		podman start rhel8
	fi

	exec podman attach rhel8
else
	exec podman run --name rhel8 \
		--restart always \
		-v rhel8_pki:/etc/pki \
		-v rhel8_rhsm:/etc/rhsm \
		-v rhel8_repos:/etc/yum.repos.d \
		-v {{ repos_path }}:{{ repos_path }}:Z \
		rhel8mirror
fi
