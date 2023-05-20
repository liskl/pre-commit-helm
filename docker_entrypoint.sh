#!/usr/bin/env bash
set -e
set -x

/usr/local/bin/helm template $@
