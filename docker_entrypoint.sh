#!/usr/bin/env bash
set -e
set -x

ls -la /usr/local/bin

/usr/local/bin/helm template $@
