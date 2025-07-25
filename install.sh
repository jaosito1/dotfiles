#!/usr/bin/env bash

export XDG_CONFIG_HOME=$HOME/.config

CONFIGDIR="$(pwd)/config"
pushd "$CONFIGDIR" > /dev/null || exit 1 

for d in *; do 
    if [ -d "$d"  ]; then
        stow "$d" -t "$XDG_CONFIG_HOME" || echo "Failed to stow $d"
    fi
done

popd > /dev/null

# verify that omp file is created

OMPDIR="$HOME/.local/share/omp"

mkdir -p "$OMPDIR"
rm -f "$OMPDIR"/*.omp.json

ln -s "$(pwd)/assets/omp-themes/main.omp.json" "$OMPDIR/main.omp.json" 
