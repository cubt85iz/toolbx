#!/usr/bin/env bash

set -euox pipefail

readarray -t PACKAGES < <(jq -rc '.packages[]' /tmp/$CONFIG)
if [ -n "${PACKAGES[*]}" ]; then
  dnf -y install "${PACKAGES[@]}"
fi
