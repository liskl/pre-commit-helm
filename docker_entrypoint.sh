#!/usr/bin/env bash
set -e
set -x

exec "/usr/local/bin/helm template $@"

