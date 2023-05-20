#!/usr/bin/env bash
set -e
set -x

pwd

ls -la /usr/local/bin

ls -alh /src

/usr/local/bin/helm template $@
