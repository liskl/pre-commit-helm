#!/usr/bin/env bash
set -e
set -x

ls -la /usr/local/bin

ls -alh /src

/usr/local/bin/helm template $@
