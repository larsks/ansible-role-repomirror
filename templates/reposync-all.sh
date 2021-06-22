#!/bin/sh

echo "syncing rhel 7 repositories"
/etc/scripts/reposync-rhel7.sh

echo "syncing rhel 8 repositories"
/etc/scripts/reposync-rhel8.sh
