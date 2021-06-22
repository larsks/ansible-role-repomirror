#!/bin/bash

set -eu

REPOS_PATH="{{ repos_path }}"

mkdir -p /var/cache/reposync-rhel-7

echo "${0##*/}: reposync starting at $(date)"
/usr/bin/reposync --newest-only --download-metadata --downloadcomps \
	--gpgcheck --plugins --tempcache /var/cache/reposync-rhel-7 \
	--download_path $REPOS_PATH
echo "${0##*/}: reposync finished at $(date)"

REPOS="$(find $REPOS_PATH -maxdepth 1 -type d -print)"
for repo in $REPOS; do
	echo "${0##*/}: running createrepo for $repo"
	createrepo_args=()

	if [ -f "$repo/comps.xml" ]; then
		createrepo_args+=(-g comps.xml)
	fi

	/usr/bin/createrepo $repo "${createrepo_args+${createrepo_args[@]}}"
done
