#!/usr/bin/env bash
set -e
set -x

read -ra array < <(printf "%s\n" "$1")

alle_env="${array[0]}"
region="${array[1]}"
chart_name="${array[2]}"

if [ "$alle_env" = 'dev' ] || [ "$alle_env" = 'stage' ] || [ "$alle_env" = 'demo' ] || [ "$alle_env" = 'prod' ]; then
    chart_path="/src/deploy/chart/$chart_name"
    values_files=(-f $chart_path/values.yaml -f "$chart_path/values-$alle_env.yaml")

    if [ -f "$chart_path/values-$region.yaml" ]; then
        values_files+=(-f "$chart_path/values-$region.yaml")
    fi

    /usr/local/bin/helm template "$chart_name" "$chart_path" "${values_files[@]}"
else
    exec "$@"
fi