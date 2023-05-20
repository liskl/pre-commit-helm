#!/iusr/bin/env bash
set -e

echo -ne "${@}\n"

exec "$@"
