#!/bin/bash

set -eu

REPOS_PATH="{{ repos_path }}"

mkdir -p /var/cache/reposync-rhel-8

echo "${0##*/}: reposync starting at $(date)"
podman exec rhel8 /usr/bin/reposync --newest-only \
	--download-metadata \
	--downloadcomps \
	--gpgcheck --download-path $REPOS_PATH
echo "${0##*/}: reposync finished at $(date)"
