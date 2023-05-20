#!/usr/bin/env bash
set -e
set -x

ls -la /usr/local/bin

exec "/usr/local/bin/helm template $@"

