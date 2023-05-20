#!/usr/bin/env bash
set -e
set -x

# parseargs is a function that parses the arguments passed to the script
# and sets the variables accordingly

alle_env="$1"
region="$2"
chart_name="$3"

if [ "$alle_env" = 'dev' ] || [ "$alle_env" = 'stage' ] || [ "$alle_env" = 'demo' ] || [ "$alle_env" = 'prod' ]; then
    chart_path="/src/deploy/chart/$2"
    values_files=(-f values.yaml -f "values-$alle_env.yaml")

    if [ -f "$chart_path/values-$region.yaml" ]; then
        values_files+=(-f "values-$region.yaml")
    fi

    /usr/local/bin/helm template "$2" "$chart_path" "${values_files[@]}"
else
    exec "$@"
fi