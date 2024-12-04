#!/usr/bin/env bash

set -euox pipefail

# If necessary, install provided repos
readarray -t REPOS < <(jq -rc '.repositories[]' /tmp/$CONFIG)
if [ -n "${REPOS[*]}" ]; then
  dnf -y install "${REPOS[@]}"
fi

if dnf repolist | grep rpmfusion; then
  dnf config-manager setopt fedora-cisco-openh264.enabled=1
fi
