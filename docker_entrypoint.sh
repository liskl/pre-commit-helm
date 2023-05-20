#!/iusr/bin/env bash
set -e
set -x

ls -alh /

echo -ne "${@}\n"

exec "$@"
